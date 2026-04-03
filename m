Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B93D6CC4
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244826; cv=none; b=no1m+o+cCo42jUYhVdjQeFgpFjMrQME7oEhNDUmLgPYzElBT4zhTVDU3Ic/4vRa44dcPGlnC21YApOX8AQo8KbZg6dhb935rjV4PX0+hmZti75GwTLVr1i1vT9gqTcCc3MJ1lLgOeoZr16l/1dGtgNGVvgykjUxKMndp2VcFkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244826; c=relaxed/simple;
	bh=IYipVv7qJiP2BZHkGsUK0L4UYMsBOF1i0tnR9r1ULJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W79YCH0eFyHma9TK6AUo/zWjHbaBwixz//MjDSZnefBgl96CF2ajBsSjxnZ2cfUiA0B8f4/e+TUtHzkQCMNafiWBhaPgEqgTWrQgbd8tcgYPbJ3lGPOUDnMnsm529FYnyQs1HUbm9PgcHmz2TJpxErpWh6v51hFThdkIqJWqzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGrO3P2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMPEYHoi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGrO3P2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMPEYHoi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633G2dSp2707236
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kZPUYs+b0mIU/ZhiroF9fq7z
	487yqQRqJHomPd4ooAg=; b=UGrO3P2r+r6lREb9nTHGY86LsAJi2v4vtUNIMr+P
	B83GBLnqnrEcPWhG8Xcjsxrs4u8qfhnziqy11jB7RZz+JnjhojA6HNaUriShUPi6
	pdpSnIF/NkXyzVRhNZ6YKCuFwT8fxy8JaUmUW3UUBjLvQdfdWY6OiS+wd1pmK/8H
	hhE98VOTkyPMSB2DZRdxQx5LX68pUOMOHAzL2YyOZmktBE7AGoog/hs2Ft+jsULi
	fGO2KxrAuhmJf4p45rvOA/Gm1zl6lHehaBfVK09D1mD3jDhexKB9erLJ2EpeMvN8
	iPFQxeB2Mdlmx1Dj7MwkxpFW63yzAaEgCq4q8dfoTZqQkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjkj62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 19:33:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so39548071cf.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244823; x=1775849623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=GMPEYHoiwl0XyGd9B47Ar7lB4lM8jLXKpR4tEo3USdcCJxiUpIZC/Vu0sGB5R7bQlv
         wranQwq9nw5CxHgFz1Pn3gdyCYr0ZcRq5J36srUIQ17TKXv13VIB+H/mgFRHf1yqJ+XV
         GPHhO9djAfUFA4TyplucupepKAQ6mdG7fMq+JTD7EJ1TM5lBzIJER2f9L54vOvGTttWb
         QyXdm7iHeC2gGOsxUsSPaNNcHCAV8YaLRxso9zCcD9lSz6Yy+KFwSJvON93gIWDCT9mH
         MqHnd8nqsUEC8FuAQI4i8J5QDSN8d/ohtjBhkmUswRoKf0V0Vjl5XyOVDi/pq9gsxetG
         dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244823; x=1775849623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=imkdBASmwmSjXC1aaaH3zYUfPS7T9lwwgRK+fgjOTCIvkrzZzMbZ886fyKPP8y9kS0
         s6L1+CZDrTSjt1GZgeR0hygxq0QS5Ny9yLe8fUoVCOjO/ID+7dmWt3ciadDaz49HwAXo
         DNyKZBH7nbUYIc6XHtgDgKXYZrcXTblrKS7c2q93Bq3VR/lvba5bIs2G7cMLKldtsLD/
         SRmVeZEluqO5PbjOBPhOwH5jH+hBrqYhFEDupsJ945w5bdC7tH3RRdW58D2yjLS1D08Z
         L5/EZOtDHLnr7CfMNeYG9YKCnnQoeiQKKz+UquhZpzJ+RWiow08cBhpYd5i3lOh3ybZB
         Khtg==
X-Forwarded-Encrypted: i=1; AJvYcCVhH2TCuzVDdETSHvApvfhxKw+PyOr+cpztoHfKhjJRACjKCQqWy4WzNzjWRViIE9O0TsugGg0i0kj1rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ7IDb7xgfJvChPJPEds/Ff20SetH/JFPUjAjhv2/g54JBsl26
	1++1X5gRZriV7nacTg7B+khgr6A7qE/8QxOWgnqNhGacXmSZNngLJjA5HfgISheygk/tz5B5C8y
	DXNCaqoZRlK9fbwYuwic0Gx/wbmg0aMYchbRkrca3TeHtFLXEfQ0MnUhXtYhUNehTOQ==
X-Gm-Gg: ATEYQzxAFvhWnHRMlbrVxFh7EkosUNf+r8u5m/Mn0LRWMsYnusplFoatcQQ2tVVQEN9
	E7+RpJq5vmASPYYYl1S/PNvxUy09Mmp60t+VehIbUIOGWIVXmFKj5icJpSKNbKRMuag5Oa9E72L
	IjVpyZOaVintNgzmwm3T1gApjsLLfL7/n98A+G8xHTmzryd8Hll2k+H4dJCHCFecmlrzv0MX4YE
	mUYovHxKnl5ZNbkJtM73L7/0GprgqtYGECgcSQcKblJL91KZ52iluMP7r3Wtd0uloxCFIagykMd
	myZiB+OOupU3Tgo/JfULnbjA95C2UqeY6XpInsvYmYL5/v2b27l1dccy22UEkUlRURPCnVx0TsD
	euUF9fQYeAOn5XLHz4RT4mjqYxgT1VL0Aqe10slQ9ALN2wSjbCI1Xvz/3B9MTzU+C9w9JYk9RAS
	xXtcuc9zPkdac0zj5mgHXhhP8UEs2xRYws7B0=
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694501cf.54.1775244822831;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694071cf.54.1775244822363;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd37b3sm1627417e87.78.2026.04.03.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Message-ID: <cwhd2tcs3asdxqcjspq6sqefx4srixgkje37hf4fylc24glqey@nkxctkq32hwn>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
X-Proofpoint-GUID: ywMKdP8qmN_Er8jdImJPsvihQSf3cgyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX+/6Jj2P3KK7X
 dwmo3BbRpl6wxgLK4X540Gjwf6zyRyty06jWn00Czt9EQz33ulmVl9VV8COCtgKsIjr/84V7twL
 rinoaa57u/TLNxPs6LXgzu0D018KN9LqJ6YA3KxXq/s4ezi+8IDk+Grpyzid/uDjuhNR44mpFCY
 LuceNFOSi9QC30PdWqrGbEf1/hcW/X8uVe1lQajV1bh9sHukj2Sg9jajIOiWhAFuM8Mn/wDEGzS
 jugfOew3rEBLfyY7kNPPZOw/8rHHXl/62MaBf7RvTFGUNns+NhP+9EX8INCBsA8FUJCJxom3c9j
 gFC93e5Dwmtu6JsFa8klQ4TVtdMpo0pd+E/zwt0DUnO8YdX/sSsl7aoi+s703+F9NISVQkn/gft
 hAAd7iChTp8FjQylMT7s+Vvef4iuvO7iedCs0JXT4KOHxPiN4VMTJyDC0BIOmdXgZcps1+yy8du
 6heEvOtiyzSoYUnnYAg==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69d01617 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=NEyQqhXCQXLKNWlO9YcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ywMKdP8qmN_Er8jdImJPsvihQSf3cgyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174

On Fri, Apr 03, 2026 at 03:52:52PM +0200, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
