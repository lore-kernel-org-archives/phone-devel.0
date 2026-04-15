Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA103AE1A0
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259980; cv=none; b=G0iwiSCM9Zwx2iK6UnETAAIEYB3vLUTqfScfd1sPLmPrFNGjzTz+whYUGnxNRTKeW8jyXSe8XH3PHZzgzGgyweBJERpa9yMAJ3c4NBaCO+/IQDhIAGlRFAE75MD0NzMUXO/81T1jvPGeOrshPRG06J7ZVfeo/PpdFq0S0ic0p24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259980; c=relaxed/simple;
	bh=NAj2suSUj4tUcP5Z2Je1pZXruisEGSgGpugY2xNyNh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2TzsPh13im0G6vEoXmpygCCdbykYGmxHRyXiRh1NdLb1JwBfpbgV/PM3ucMOhGTjEtwtRwVXP+1g1alcD6VTaKM4yluyRZZ96FfNZQ7vW/DlU/HPI1eGKwlHGxdz3Jm8009cMgIuZxxrOWV45I++J8y+9fUHnQaqa9/1BTUR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPhwp4K5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9Cj1NE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPhwp4K5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9Cj1NE+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9SJs8731460
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 13:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7VmMGbz1juC7H4c8Lb1ZUKNh
	tUA/XDl4zcDA/eoPAlA=; b=oPhwp4K50aPuXTYKvq7u97E8+3WjGALcG4XFxzqz
	D4RrZwZ307Mg5K2UdVDofAbNroECsdofnLpF6sLXomjLWprg9pQmyMYCuYYwa1OP
	L51AhBL4Pu1q2aujFQKPWiwJNX+UwP1JIPsL8spEVIku+6iqb01h+JajWuI/5+5a
	mBP5y7LemVwNBflbcSbqMZnG8ejGVJQYp69jElqhAXwmB/pPlMlNtNcDvWnSVHd2
	xD6bZDxxVHeAbr2PwQ0uozCU7KCQpIY+zlwhq1Wcism4Rf8ZRY3yG3g0ex9bzgi1
	AWhCbojQujQ6SxFIRme5SK8Cac+IH/eqCOdxGuAX0O2g3A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruubwqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 13:32:57 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-472d903d34eso9908341b6e.1
        for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776259977; x=1776864777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VmMGbz1juC7H4c8Lb1ZUKNhtUA/XDl4zcDA/eoPAlA=;
        b=M9Cj1NE+OQeXhaMZOdgpYZlt7UhfEmQ/R1QYNYvARLN9/DeG62jwwqkop33wCe+DdV
         qhbbOKF48/8cRs/awe0oOhi55xX6i1kFcr69S/yP8h85S2JART3d3wkGMTTNfBMRgkNs
         NTrzLEKXsZzb7UYZLnhQka2esOIkURh1F4Td2bJnSZ0q+M1qt0kWt6YrtCGcVybNgC6U
         /3Iupj7VID20iPrDGWUYyKDMnFGw1i1rYXKYree7syuDUcw2pGfj/zPG8T6ARKXyuuSi
         CUMQIo6ypNuJtpz6vCPZQwlyqSqnTAfwc/8yC86RMy47uKeThY09Fq8V94QGud6d56hX
         fn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776259977; x=1776864777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VmMGbz1juC7H4c8Lb1ZUKNhtUA/XDl4zcDA/eoPAlA=;
        b=EXNPhgOqrY+138vGuTvlW79+ZAw0zOrXQt6w50h9BAWKsKXOTNIexz03xJM3wkqcA9
         zH7j9K9GVteCuf7yIOdwz8ReZcoNngrj5pEm8n+hzVaWVg2yaRFKrOc7wYhWkkS1L9OH
         XSBXqhMZPFvWIygGdT5rwvz1Z7ml6FYuUbij8lvYdds75Md27xtinsNgEihVNW2X8W2Z
         ADLvMzA0ge8T94JyMqYEHAS2YT15JDxYD/f7WROjoM6KTfra++vLxse/oSGo0bbVNKtg
         +8378X9+Zi06+LSxwRd9stCfu9AOnD4aKmUCnGRub36j5g9x8d9cSzwQ+GD3buDiPjpS
         +GLg==
X-Forwarded-Encrypted: i=1; AFNElJ/wAuoryTv8I37Zg659jfT9e0w3I475IVf3JFRn7Yit3E2oydNeQOq2ucob8jJ+tAkWuYaLxcSRhVwq/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz225Oa35s81j/rTibJiXN8ZGnkGvtZ77q1P5Med2M0ZO6MOo2p
	Tv68/NwN/SheFfyIPlnsA3b0hMl4SrKdXJgLnoXdp6pyIOEvfzuVvKg13gD2Mn6hULuPI//F381
	GwTCJlYF7N+jc5tB6bsCf/OQQtsriDftY/apuqjquayYXoTjpuIwTDOqIOWHApN9+sw==
X-Gm-Gg: AeBDietiJdCvvKEuWSHi/DVit4zfaa0ALEAkrfRbpMRaNcXZVrC8xx77s9RBNXMYY97
	M8sKVAkib3BYTDc2J+NOdf2YAPsRIziIXbUqT15snK23mHKf7EKI3bGyQ5tqjpvaOjeQoyZwpEB
	QMna+FwJBuNlqp2XTTH2lpeeDznDbqgh+Xzx+mNxoWH12Wf/SNZRBV+D2WWQbpQzzWcAUY9gbbi
	sVBc0ywT2OY4ZfeKbrmM/ajdQgXfT72yRhuQcS762zeacRzozBp3EXdPrT2fUpdt0Nc3vrQ2yQ+
	FvXNsu3G2BabqT02d2ZRmP/WiZHlOiBoWEtLI34Qdz7kjzmG/9FVSaKj5yM1wo2mTy1YfZWGloe
	JSQa5WOcyiPr951zfZZISGfJwwU8g4EbmwffVjVDldN5xjqNfjiuI0+Z/pDj651qydqjxmjBnoY
	J/pcaWJ0woRSlQ5oHC9WWFzxYEzBFtplQgpkY6a53v71+tlg==
X-Received: by 2002:a05:6808:1c06:b0:467:2609:1247 with SMTP id 5614622812f47-4789e03d193mr9596425b6e.19.1776259976888;
        Wed, 15 Apr 2026 06:32:56 -0700 (PDT)
X-Received: by 2002:a05:6808:1c06:b0:467:2609:1247 with SMTP id 5614622812f47-4789e03d193mr9596408b6e.19.1776259976444;
        Wed, 15 Apr 2026 06:32:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a2fbdd0sm459812e87.68.2026.04.15.06.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:32:55 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:32:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT
 properly
Message-ID: <ftseg6hw5tbjwbxkz5i3rt5wnauypdtw7pmt7fqapmdgm5dhuy@ht2mxa2qurju>
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
X-Proofpoint-ORIG-GUID: qnJ3v6PJ9objePcC3OyphcdYscTNB05f
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df9389 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=i1Qc4F9nIsNgxiQxDngA:9 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX3oKMnccQxPxK
 ZFwx8SA3ytXoGXZxkSY/M6UuJzAScgwQWi1EXhqtwDpCiCcStPXamKk4Wzz5C7aJhXUHWDkKILh
 IJw9Ux/UxbhV9aaQdXaIxSt34n+C7GVtzQT38bUD4LuRx5eEf7r31nxpIWZu99WczV4LlNz/qVI
 /56Zu2cjHBvpAh7/YCnLxXjwx4vU/QHhK3czjq4CUhl4ihVT/uqJ5RYVbzPf3TJ0IN4ihfmnqdl
 eeCx86Y1hAvbER9a2xG39NGnYvIWxBDpjr1vKMBQkLWH8MdYTVSPKWM0cOtTZeL9URjQ0JxrX2A
 gV4PaRkaI2ee8pxvp8DdIKOCDM8KlwPAIlNQSp1gZvq+HLOVbaUC7eLlJtE8hQDLI1RGk3hXybd
 3r3mvikKtIzK9TMSDytvmpVt46Z/R99EDAb/ghX7SB5zdmjj8HwWDoZe6MJ+lMOKJ6xeKAQ4wpe
 TZsDSmJ8CTgbW7IjSyQ==
X-Proofpoint-GUID: qnJ3v6PJ9objePcC3OyphcdYscTNB05f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

On Wed, Apr 15, 2026 at 01:56:08PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 65 +++++++++++++++++++----
>  1 file changed, 55 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
