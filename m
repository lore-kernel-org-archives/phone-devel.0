Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09A1E8356
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265260; cv=none; b=YSmHu1qTMkO6IMv/A73oGDnqT6nK4B9Yn+ACLFf74r3IK4u923r5KsIen66M6a45tLqC58sVF8eV+DfW345DsPFEDtP6W/XQ7JZ7Lwcz4ybcsqAlKa/U/37ziEken8gM9j6YWsOq6SmUQbtw6xDqK1xlX0Tkaq/Rzrs1QLPymlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265260; c=relaxed/simple;
	bh=pA/ToDvdpTVm24xr1xwcyTjji8vGx/vbj7BE/Ixb2hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG3rTZRpNeUwZLTzhbpLdoTCJZGshEaYIF3BBIrqkOy+XSEFS7l6rhYMZ51CF814dSd/mlzAzWz2h7mqwFL6h7TI4ZrUa0Yb3F/uf92FaaAWlkbhPefG5lrJFcaV+qY3LY4ke9kLxcUneSu3gR3aiKmiEI7sNYgj0IQo2p/Urwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGz1ucMU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGz1ucMU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgZc9029354
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wqgz1pvZsK3oV6w6DNwR/nus
	F1riwGEGizHXICJ8OPw=; b=bGz1ucMUhATKrtCEV3L+ESmTmTv+RNEgyxfP4Lhp
	3NR30j85SxuLPGp2APt7PBv7HUzBxn/BdyrynEUyyU0I5LvBC7WpklpLi7IQ4rzh
	fV6Dt2/vADrW2DqJmz7jXGqoUPzcMNyCVh+IFK5MngD5+AGBGsNjuTdXSEyYOKVl
	HlPPkTfBC7m4YfQzHuN5zxSr/SdnKb7FTvvspFm+5HZJfhW8zdPipKCpstjr45Q2
	UAIraWRZRX6bfOmpAORslZTrLad1Plp17CzTSLvXseBf9eAQwPPwJok0FIHxfvbW
	3LBqikPICh9BhoyxvTnWmDj/gI/Gy4oHFsGYIW4wJl/viA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1d580-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:54:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ed0cc28f7dso109411446d6.0
        for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 12:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745265256; x=1745870056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqgz1pvZsK3oV6w6DNwR/nusF1riwGEGizHXICJ8OPw=;
        b=NIAaDagoOUstBFTvAk6b5XGf5RIZBlM0Lu3EEgV4Fidaw2F5m0nC5Ws08Ua3xnXUVY
         /Ql5q4qSKJP+HvVivLOU6cvzTvzvGf/nHsIQNsz5RQX49OWdCQ4Liw0g10GM243wTDsl
         Iikt6Wtr3+QosTncTWLbZxeGt/ceAhQgeC6CltgfvcAxucJ9O8CQSyRRkfWtZ2PQYod3
         Lh1yJuxk/rIDGHlfaEGnFTztWqtVAf2bkbqO+kLKNy/SaaF8TPVtmJxJBI8d4h4TJWYn
         +kCDqd125T33hD4yPyJ3gmPQsjClWKXpqqj9d7FGyQIPJft4VjTWGL07S9b2EYPnrRoQ
         QoBA==
X-Forwarded-Encrypted: i=1; AJvYcCXyxoa9b/RURerBBF391Rgqna3kbf5XuMWe2eaoR2Jg09ymnhsCYfYeEv7yBCPn7+ebZ4PPQZtb62EjOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGn5PNPWMj4Ib4Jm3lt0vDnZObz8uC3BwCRHnrXEckV4GlU2ro
	5ys89sFY1WEcvq80qp+QNQbUB6nTk481GwAaqJaOlOcsVUl7azrhok1B6Zqv37yiIDffB63WB7T
	t3E2y+ZvhDXBUghRbJwEdhKtV8lnm6Kr4xOSMP7SyFAZUtOqdReWbJMq73FfbSw==
X-Gm-Gg: ASbGncsCVbMqWHC+1j1GSmZPtXEINb2Mw4BfLLT44cDCA2CvTk93cpM50Y69SpGdKqk
	ATHmCcf9/0u7/XfTZsTr3Y3Vin/dM5iBf0U/CzJw+Mh2fWCSibCNijAG7nLWqGn02GP5hwVuKhX
	bAtI25v2EFIFk8WGZDmVofk/ZEe1Dxak8iv8vKudcPOs5xjoJWyx73bEKri67ys3+1t0xJY8uD8
	AsefmSLqOAAAR4pYi6XttSLkIdMhjH0oXkWLa39KxoQ6j+20qHJiMxHwoer46qzTsHSoxpculUf
	dgAmQxG5nRJOFd81a0dM7xJ4SN6Dw31hBUX+7M5o5uGLq4n9Ht9sQrA3+T8B3Usi5ke7gEkN1uA
	=
X-Received: by 2002:a05:6214:e6c:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f2c4577c1emr250811326d6.23.1745265256650;
        Mon, 21 Apr 2025 12:54:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhE1DctXsRfKqK5IBLJQFAq8aEHEgx8Jc+I8J2DHtXC+nU90RdD6J6JfbcA5DfHAsPaRmFsw==
X-Received: by 2002:a05:6214:e6c:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f2c4577c1emr250810836d6.23.1745265256302;
        Mon, 21 Apr 2025 12:54:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cfe06sm1019459e87.123.2025.04.21.12.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:54:15 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:54:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: Add initial support for Sony Xperia
 Z Ultra (togari)
Message-ID: <yw4sgwnzrsefahji5lwmzdmp5ozi3cuw7uuw7mkimztr7z3rh4@oiawdyze7d2e>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-4-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-4-45840c677364@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=6806a269 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=jmGcUwK-_ZklpmBGyDgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: F-tE1eXRc9ZrveLwWdv_7Qgg_ccRJDJ5
X-Proofpoint-ORIG-GUID: F-tE1eXRc9ZrveLwWdv_7Qgg_ccRJDJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=764 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210155

On Sat, Apr 19, 2025 at 11:00:41AM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Add the dts for the Z Ultra. This is currently almost the same as Z1
> Compact (amami) and Z1 (honami) as they share almost the same hardware.
> 
> Only USB Networking and volume button are confirmed working.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/Makefile                          |  1 +
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts   | 16 ++++++++++++++++
>  .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    |  2 +-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
