Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B402D2459ED
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386434; cv=none; b=RRf1NEStl8WBQRDEVNjFpr3T2kLIwA5gZ/uZn1NUwT9F4Cn6+jGEWLq7ORRRKGfbnyqEhhhUmgWRi9c6C4PHsbPinXdWVHZ055AzeD65/cSPF3U2WBpoKTBm3Rj2hVwjnPrSqlrm5sO7CRmw0gLq4ef57wp61aoXRguBOHmKY+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386434; c=relaxed/simple;
	bh=oZ6biQlUavfRiUY19bFiHKy6Eg5T89JdTcDL2vx32nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkhfsEjrrwW+kwGnPY60UVKlC+aQmWgE5/YX6d44xnBx6dKdtqgR67F2SKFb/tKMtNCo1CqyVLcxyMTpL8KUjFoxxysd7MIglsUVekzdqQ+xhig5uGcrbGtaNmHBORYxespERIXtk81DJdfZOQKZdLGs7xyKnMtitYcojV4nJdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izPCDtIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bANgUguL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izPCDtIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bANgUguL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCiXF907717
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 21:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMtod9n60PYX+NHvr/34GVR4
	XcSoov8oJ4iS2SIEqXE=; b=izPCDtIPgdqQqJpy+wehLlq5Vfo9PXN90/d7yooN
	/FzGnAdkruPRJLTTOGo1nePC7MVTucYJ6idvDJEaegu4ldFUWr5EtqVdJ+w9J6RT
	HZXeUcU1GTIVGd583QyNz8UN1mqK9mP7QkFU23IbPG38uWEVRBv50M57fWxyQCNT
	ubZo7knDR9eAFxhSxzeEYkJlsmDfZerS+7rxKqUMpTiSMPSb7pN9w/tmhp6Phpnf
	1z9Hp60nlUDIbWrhsQu1yWn2sf3NfQIkCpXF5X5pZicMtWw1QSDM0p+K41kuwFPG
	ThBKc4Q0U9suxRzanPZDGwDEpskvfWLdjmQaN8ypAR2uCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9pqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 21:07:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so409551891cf.1
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774386432; x=1774991232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qMtod9n60PYX+NHvr/34GVR4XcSoov8oJ4iS2SIEqXE=;
        b=bANgUguLp35TR+4jEwMm5yIL8PT1kZkZ2tfZlEWvq3Z6jQzvibarFYT5X4AFJ7tIhX
         5pxanKrIQ9TCgDDMTyktTwXquiTO7uTZAOypjIhNZvoT3EFUF8C5+fKoRCOkWjNiGdsW
         BVawacIVbgrbVtI3bcDQjYOA45fHOibyDZXZuR0qLlyJx81oNsCtj6UN1ERp4c636kzO
         K42L2Z5wsV6SAiHzjtRtrPumUMpmNbIqxjuItr6/mPjCb7b0RjsXmcjg7lc4TLf/DJAW
         UboqBRhAM8Rocm5O+EU6HIWjPspcJWAkn1vsDPsU80ajYtGMjERNRFKFPBuOzR7e3ka0
         JRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774386432; x=1774991232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMtod9n60PYX+NHvr/34GVR4XcSoov8oJ4iS2SIEqXE=;
        b=SMXZM+tzXtwiE0GPrGKeM7MMWe6qerapUdJ9X2qO12oatqCcCxOx/3Ifz0Pi0Zgc6I
         6UPqGwERIjlwts1UgWMEm34sACxMBZyRb+QfKp9xCh+miLA5l8z8Fk4NWOe+OfggYL7T
         4Luz+cAnbbOVIncLorQJKowxnGolcYMFnThyjS/pS+NnmRJ58ffOjHgfZdBMCmvVE3AQ
         FsxA5w6gwjnJs/hLHHBI6k6dyFLjM4+Ga0ip2yZpizeGiP1BwlWIo4B72FkG4nhcTTTT
         3jc1SqJitFoBRY2i0pfgOtZIiZyPvxEa3iglKidJrYBbVDiGl1vp82gSwyZnS8ZL8bNN
         8gjw==
X-Forwarded-Encrypted: i=1; AJvYcCVmycBh9E1PChyO1LFY+8BiMyoHYHqPfhnI8pkJZrwCJNXg6+OJsODLyI6YR/WUYr3UErP5Xkc7sqRPww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdWHXjT7hXI1FAEG7+9WBjazha4R9OlU7Dc1ZO1J8vvRruCbG
	+M6WOFZ9adOCtgien4O9QsXNvx3wQ4zgXjm/5q7ASX7haI12bdBPqHOLpGBWyy/Sqa+nh1A3Vv8
	wY5xZWiJ+bEVZUi9h031P08XVwTNmq0yDfrx/q/OIIwYBi8/FTwq3R/+EC90+4c6qKw==
X-Gm-Gg: ATEYQzwBFbiCU1YzciuAg2W2DllZVJ3DyUrQ8Be1j0c878FULqaqNd2/hR8Nx9VXUJW
	p1Sdvk2kU6gENZWJraP97jjvf9mmZoAfTI818Yc7StQL+Evr+5zu+5KxSzxIe6jypat4ynLPRoc
	sZMh5f0LmSmfrRLM2Tm2FLXa0RX40ONy23bdkQStyBxT8JrHWiFbVjyE6ouXIP1RgMfiZxqHtjE
	Ts31NS+ReInyOJWeaxw5ZSQEXpPXHmajXre8Ab5ByCT2XhLBjw9LYdGtmbGqsfTnYgdEc+dZWNz
	IoQAclpABTUHRTikfWwl6u1v0Vr+aQqUK53h69o31YtviCbmct0+FOXv3b4KlSbRnDXa93RtUYn
	Dwgz1EOdJ79Zvq6hDyuOEUHc+37gdvfnMQz9mFqeSuNJGQO42LdmSl72CYuL7OFeWtkjDnc1WUe
	GEqBCpFLzBGDsQ6rjp+FRMHRsvX3GXoeGUV8c=
X-Received: by 2002:a05:622a:4d4c:b0:509:2e61:43cf with SMTP id d75a77b69052e-50b80ec102bmr17916621cf.65.1774386432015;
        Tue, 24 Mar 2026 14:07:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4c:b0:509:2e61:43cf with SMTP id d75a77b69052e-50b80ec102bmr17916051cf.65.1774386431591;
        Tue, 24 Mar 2026 14:07:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519fae2sm3351048e87.20.2026.03.24.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:07:10 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:07:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 10/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <cor6zaxqrb4bykwnzfkm7qiuvrk7xbmnfitzyefhj2iwbejq2u@75ctntjuzytc>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-10-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-10-29d70ca1651c@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2fd00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=IqCYnrxLgLuRO9zwK-sA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: h8pjP9GX2_sQ8sfR3LLs6b6c5me1_YG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MyBTYWx0ZWRfXzowrnrA9dN+g
 P3sRevDhJIENNICbgKYwrsPjYjzrWpkEM1M4kscLIAY2917KiMUA1zc2OlCVmPBF/Zdo05VNQeK
 T+Rppb0gZSHc1eyqlNe46tapYdrrnKcj5bzX9/o31AoaIpjIdlA1A/NdzESl9dY61HoAfrM4Mrv
 g/DHEs4PIgxRVzstZchfyBMUYY7ZfRAEnY9FTg68QH4T6IDG/SSFFv7V/VZGNCttp5+6NN2pUSa
 +Spz3vjX+v5vO8YfshEMSWeeqoEO1p5xU7a41waTnxAsBJCNqwgHK9DmQ8pwppyRWBosld/nQpI
 tvfm44Em1WkQX9y9SS8z+LO74FTLAex87qOAfTKd6Jv+vfBUJ4l/X9wydTc/tZcxhKfrC8z7Lwf
 UB7R3f44FkT2qD+cXE4o/dKU47eGZF9YuIQ50r0LvL+HeeM+kOcw6lxJhFhqgoKPBcopM2H5q0P
 rf9zhuHEk44aXC6ownQ==
X-Proofpoint-GUID: h8pjP9GX2_sQ8sfR3LLs6b6c5me1_YG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240163

On Mon, Mar 23, 2026 at 07:06:40PM -0700, Paul Sajna wrote:
> Wi-Fi now works with this patch, relevant firmware and
> qcom,snoc-host-cap-skip-quirk
> 
> qcom,snoc-host-cap-skip-quirk has not been approved/merged in mainline,
> so it is not included here.

Let's ping that thread once more.

> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
>  2 files changed, 14 insertions(+)
> 

-- 
With best wishes
Dmitry
