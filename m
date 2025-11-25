Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E12F0C49
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114643; cv=none; b=XBT0DfU4jvsnWZN2VmZNQqC5G3+1aUjQ7SkL0lar1NwfQY5gatDtXcudep1McGJbK0WYBbi4OWNVMp1yKHUu126uupRwQb0LZCKOVxZdh5vZlda+YxG83Qtuvdh2K5B/wXJmX5rOKr/EAacVNxUCqPI4H0uEKwBf7iKdiuihCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114643; c=relaxed/simple;
	bh=9/I+WLBxVQ34Jv2VUWOPSxKz0/+kco6uge5FdQSfaJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Egy1kw/MitGxTfIyp/7jfThZ3FMueyda80BioPKBrerqkALUvQrQc7qAf1uyuVpZTrXOZbXcKyfMkZvTKg6JrR9BxiuhY3S6y1wBWxP0IhXqZrtAykxCMMuP46o0s0bz3nrVGU1r0O9Mj/wQLLh/cOFHwLDygng68GOJGy4176Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9qOF5wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwCC8U9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9qOF5wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwCC8U9g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAgT63890277
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DpjUEb+lO/d5XqWetRnIyO8+
	USr+7eXZgV8h6ZiGl9Y=; b=j9qOF5wz4FySeSiET9C3x97eXIqY/tQcVJvCmRnl
	bIjPtCATItbKPt2hjdZn6QmuntIlmxDH1MOAo9R//VyKaY7JniDDS4aLnnlGfZAK
	HOeTtbzBLpF7LgnX0BbLTI87gYom4cK+h1xpPXQNcmP7bIUHtC96gdJ/Jc5iv8gq
	d5ScBRGUgmaXAsyrvIDfGEAUAqxbJ9TYS9t3dYVfXaWv4CYTQvcwto/mkUZW8JS9
	kcqxqiqFXVhr6OghB3de+vNbWY5jgh268Gb9kyiXvRv3BTZE1znFgi3MM9R+Dqa9
	ITmW2a+1g6AScplMLslskbGtxguGYFEeEfm6YYKA7BrumQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8w1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:50:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b23a64f334so1598127185a.2
        for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 15:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114640; x=1764719440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DpjUEb+lO/d5XqWetRnIyO8+USr+7eXZgV8h6ZiGl9Y=;
        b=UwCC8U9gzU2TveL5fIhdjuZGrT0Oi+36abKHJ4mty06r6xKlfAeyygVZvEfmHT3Phv
         DttWpkOSIvAHZdp8ZVbaR6InHfkv5DqSyNS/BeIiuyjwDLrmwew62nK8OoaPaUsZFcfg
         W8x0OzN/b28zO+PFQi2mzW5CuO+059nJUvbr/1oOTrJnj2hOtimreeYkOTLNJAMWStaV
         S5o4TW6sWlF+oG0eIH65FcZ3JP8N05VgIMFW+op9Vw8Ob3hJk2mKqEw7e1D3GtYokkH1
         94+o5TOx2mSfR5EgKAiX/53xE+LiaJTK9sppH/H5wdBDvUAK0jRNE1CdDJBZX0uNC6/+
         Jb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114640; x=1764719440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpjUEb+lO/d5XqWetRnIyO8+USr+7eXZgV8h6ZiGl9Y=;
        b=D5LRhc9j3ODnjR0f003VR8FZnb7W5y1mqx5zLrh1zxriK/CG+Sn54YEjYLzxp4aK4P
         hQMdaEOheCjRDKmztfT26TtNslU6HkldHWb6eOIBDPWRoexdv+yu8CRl7RE9uMHbAfbr
         bhxHuOSLFN/WF+oyMyoFcz7ESlgwIqbIPMV4/vo5Sw1IXW5CPCMKb9x/jdF9Nbl7HQXc
         xVkxJczYG0Du32XtdDxSZnOb0n36T6MvuImNVfG30x9GPo5MlxWfnN91ZQYFRc2nNuDC
         MmkT+beCrc1q6GgBsL+ibpl90xtnPB7nxKWCm4BAMqYsUr8ygWklXoE3WlgJHgl3WXNf
         x/7A==
X-Forwarded-Encrypted: i=1; AJvYcCX2S614vbZITSlh87cab3h8pPAmT0NopGjzdSB8eXXYY3AhRnxLramXpIYx1K6fEkMLI7EeRuNvU4LNCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEyLUgQWh0CS8kB45qWp8AfDv4/Ue5sao4ObwO2HlwcKjoam8
	wUyHLN/w3Uh+7QlicV8+x3OI54dHT2dhkPZfP6OAI55y/RWXgFBPAyH9Ar/idaJbXINi0S38XJz
	oDGUiryPQf9EOAl/G1fOqrLiLQyHpQjA7xwA6+qmXPBQTPkQf8ZQYALD7TVSzhx4T2w==
X-Gm-Gg: ASbGncukgJ5bKNL6npzqSReU67+Tsic+79ey38l03pVzyLZ2rRP1DwaZowCJOr/y4Tj
	tpIpTrEu0JGW1KKFDcgFWQuRTDpPwdnSWvlFUVdfUladL46UkxCfcP83mdWv/fOeA6sEQDq4AwJ
	O1E8nUC1jM/x11MmR8Y1Ui03xwnMHreC2dGdgcvksg8YfmdwFkbKBjJ6d2FjldDwkrCSs7giwf6
	xQx6Ez0TRzmRgbwh5sNAkWtj7k2Vt4Iv+UW3aAnHfQWCsV9zVIVYhzUfMTC5G6mmFYA4x13wIKq
	RsfSvQTcxq7nn57mCAaebPVMq3pJX20oEmoxPa+wvtFtcRxIY48jTXKh8pGZtyR+ew5On9dOwla
	N8JOIzTel4Y5gFJfrgTYIiuit0zNHv3dJbNXByIW50yOxnC3Ouj8xAiFdQujmHxYWXuZEILtI3k
	w02IGG/cZP587Y9RKoTi2SPDE=
X-Received: by 2002:a05:620a:4623:b0:8b2:1f21:ccdf with SMTP id af79cd13be357-8b33d469823mr2113206485a.48.1764114640365;
        Tue, 25 Nov 2025 15:50:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBnTPo78pU39U83yKEF/eAZt8NiiG5KXac8B9fVr39yPz26x7dHZeyUAP6bCjxbAjm4iirmw==
X-Received: by 2002:a05:620a:4623:b0:8b2:1f21:ccdf with SMTP id af79cd13be357-8b33d469823mr2113203485a.48.1764114639859;
        Tue, 25 Nov 2025 15:50:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db81b35sm5418440e87.22.2025.11.25.15.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:50:39 -0800 (PST)
Date: Wed, 26 Nov 2025 01:50:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] arm64: dts: qcom: sdm670-google-sargo: Enable
 fuel gauge
Message-ID: <vpqzef5zggibkmfcnx7movs75s2twu5kreo5lxsss24o65isvi@yr4njzgttq67>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-8-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-8-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=692640d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EencKPdTMqCUiY1uXwoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OSBTYWx0ZWRfX0yfEBKwmXPB1
 jawB7jApreKO4BIEQcHw8gE17r5Cfx2AM4vpbYFnGh6DwKMcgQy47NbL7atrIPxJgRIk3RGIkGI
 fVw+4aTkuabSawnDz2AXYJ95kj0yMzZ+xiaJDLP1lBB5/DEl6n2bJdwwy0NuncTPwU0xO/WCvjb
 W5vqCzl0Xgj6zD8hKBLqw7vKud80DJo9Vj3nJm6WrxQOOkiZidFOQDrQfX3rA0ZKv3wiSp4jJmp
 OtC/xZKH+ySSJpXBssPWdHLxGlAZSQpsDWlomPZ8f6ef7yP3Ex11vepXkIXOtmwjpX6AflBoIT9
 ZFk2CHhWV7xe6lePpbPPMYsmDs3hAS61t7F/2p0ZOS9pnR++dxBDlXU3apcNq2DqE1sEww2CmK0
 iN7LftYd/rNoCdhN3TG+iTIVJ+opbg==
X-Proofpoint-GUID: jEdJbWvVOrh_G-dsFeWn4LrdgFKNiNRp
X-Proofpoint-ORIG-GUID: jEdJbWvVOrh_G-dsFeWn4LrdgFKNiNRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250199

On Mon, Nov 24, 2025 at 10:53:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The PM660 fuel gauge determines the battery charge. Enable it for full
> battery support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
