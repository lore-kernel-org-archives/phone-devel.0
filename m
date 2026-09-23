Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA35A3F0A85
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150386; cv=none; b=sOfg/XKNDlz94IZB/hRjo3rGLBjpRu2FkExqQ2vdVetY5UtuE8eBdfVhKQrCCZjdi9TM4K0ed6GmllaYhPXbHzEtJ8RkMX1Aq7syfDli5eoEoxDgh55WPsZHomzSOE8q9nomdS/TDqR+fc4FvvIZl4W6yPX7FQodopCIqtjf91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150386; c=relaxed/simple;
	bh=VEqNlpxOEe1fMjABVwJSU8ejy3HEKdIzvDohBBnBmiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ls6D8AFBnXRS77w9v8yaJPubjC86pPGeBLkEyBRl/elMxIo6t2ctY75Ux9pbQFQJDmuSAN3siEm9zKdKSWDiyeQve7vMbNub2kA6ka/YypFLPnf8sptmFEDcFN29Yma60/PjWdOVHmugB1cr7/BSI97zrVikpW006dOn5nHc8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+qt93AW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvg6pAcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+qt93AW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvg6pAcy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79cV22432968
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=; b=k+qt93AW5iBoxzIK
	N7HtfLFbROkpz7ZY3ck0/fD5KMHOkgKvY7ByiMsfRo7m94M1jShAkrgIqHNUaLEH
	ObxhLW0p0iTru0LrYyhPg1clg2YT2O8WeRTai78t3Od9Vk6DB6viNbMUaJGyNxt9
	0cjzJD4CyeLWGoP6LPsPLP5i4FCeFttw/YpKw8RYn4sFFjN0bmi4FZn0ub+ibS8t
	XzUZBfTbFfYyMxf4+p8UUZkfnFAAg9yM1M+MfWHqxVaV2r2NUneFmj5s2MwSMKdo
	eazMyuz1XHXdjgT13gSgtFKGm7l/0U7q7fQhie/YSx9FqJBk/jA7GzAbdE5wIWp+
	kDblKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3319qmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so16033585a.2
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790150379; x=1790755179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=Cvg6pAcykhv4csACJg1e6xLS3IkSmDDzTkSfC3dFPFGS8tP6YPoQikdv45Kft66EjY
         gmdWx0vO+cxVEbY3aywHcCOQHfo+BwDZRzJUBtTkGxMTOz330b4CZ2bogPx/KRsLtA7n
         Z9xiYxZKhgcki9wH85j42ecCo5z5FpY1pU3JN66CD9SNWogcKaQ6zWQ2NyQ75KrKtFr6
         MxD/k76hOsUrB/vhSNMGtt1iupbcAAp+NPg1RywsgNMJOparZ9IWUHfWGMYKDHURZJue
         qALLEItelV2/B2Snv3ao3EpaFLejiLVuShZjSRogNkZjcpUCXJ11SaSVi21p2TA0goq5
         8UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150379; x=1790755179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=VZoGomrOCSZhB4GoC9+KlG0ZQkSFhWlhpG3CwxDWUyIS4Uuo7/6JZ+/VStKj/UUFzU
         z30NCqCLs6z1F4hCUD4wk+qLNrxjw6uls25e0GW1TrDHqoGgAYIkvc+Q+hMj/RqU8wCe
         c58Ju5EjQGeFDHny4QVUWd11iXfzCoOVZKQfeIiHte4eMdR/pkCCZaR3OJ7g3M3hj7cI
         4DYPE7OEpcqb+E+k4L5/XsU5i5z7LB7rFl+MyiPXQ+eK07GHZcyj5NVhlnrbKvkvMV7m
         L18Ym8HfzkldPfQxwloKF2J5XRJq3EzLivdgdaTkcwFu3o2NuC32XmIy9nxGQoNSvbSs
         04LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWsauP6huGL06Di6ReceeO2WNQFzAduTexdAycYUrXuLiBdYinj1EUR4dPQOh+kJWAjNnaPSWvoFTUNA==@vger.kernel.org
X-Gm-Message-State: AFuF++n8hzQYOQOzQM1EBbJ5fS0QC+dbjtmgp9rpQFEemRUWZ9rpAHnd
	rULbMoiEYTaiBWYhDSqgwmmZ+ZDKpqnX0uozfNW5vG4YXLJyo1wlGZoHFWIJctq50ROeJFRONN2
	uXbOzGurWV9ep27MBZ0q+xnoA15u0B04CFT+9TQ+AtJS/aKZEaSvcCtgL418u9fJVsw==
X-Gm-Gg: AYBFou0YAvzIoGkaflUC0j8zjUXzcJaiFCVc9f5Bg91QPg49R6d+ZQHfMHw4rTDDnN6
	ngHuTHsY41yeHFXRU50aRemSyAm7udAOs2yDUKeT3wjIKV/J172PkAI0CUn6sXXAsLIO1FV4F7F
	pOcW9Ov9IRDnoVcjv5uI9enYWPq6WsfQhkEM5I7NKoMlcVeOS9dssBUQMekeWvwLknuhvx7DyyW
	Hcd9wR3eolyVhR3iWqmsS3xF5OKxAXij3kXCI3tVaxWWJsdPCMAo8wuwfFEWo6R4dOGgx/mc6Hn
	tSdFDrgWeh57H/9gvUmT/UP1EInzo9c2u3jd1qmKbl9ay28LZHueJKf9DoHfZUTjr/uV49XYolx
	40j4yDLVKJLbPcF/A0OZVjw==
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285628385a.3.1790150378882;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285626785a.3.1790150378530;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bbd28sm1087675a12.28.2026.09.23.00.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:59:37 -0700 (PDT)
Message-ID: <681ca16a-7452-44a1-871e-81a5db82c036@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:59:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC
 thresholds
To: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xgMyMNYymVM_rTydE0LB9ylarfunHNeH
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab386eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LCWlJkpBAAAA:8 a=EUspDBNiAAAA:8 a=C9R86eXXc2PCoiogm0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-ORIG-GUID: xgMyMNYymVM_rTydE0LB9ylarfunHNeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfXyHUMn6JUwYtg
 PEh6b1tbDz0omlI5FTVXnTYkiYZoR85xfqvOK6IM7wCrLj9a6ba5CRXk97P01ck6Yw/ynRvvt0K
 ijZCAUDuEFalBvS5VPGgqpKjFBLtSR6EEw2Q2URhNV7D83UhjHmYJFh+BFMWvV+LIOZ6Db+v3Ug
 P0P2wmq+TAoCEIPokXk5jgAQtVXnZKG0EfxI32GkmldDJhHvGZOnJFHlk4Ib5z9vgc87bbAK3Tn
 g5aN+VTTatQww9tKsvVDl9KqezBelXW+wu0l3RSZ8P1Xiy4q/PCoOKB5AERwxGI8XY6t2FrgXUV
 2jS7gPyaCMQdZN1IrXK/fM22oAIrUEnzu4tuQZ1Eyi8mTYurfDCdLv8GItE6AR6jCKbAMjfwfos
 O+3NDIP3sAZCzNHfqtHXDEw4ZRItK35ZQGLdtfu0B6zjmEKHR2vFAQgrJAcS6jRoeriWq+EdwIX
 MeerHj4Jovi+KeO1o8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX97SECpJrXWt2
 LbOOwOmsCnoPqBBmXZ+JIbj5weEakoUid260I4bYPRFayeEPSIRJLMvPURp2cGI/7Z01Ducntth
 OaItw6HjfT4jAIe7hCSPW+WB+P9r6IQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230031

On 9/22/26 9:48 PM, Cédric Bellegarde wrote:
> Configure the Multi-Button Headset Control (MBHC) thresholds for the
> WCD9340 audio codec to match the vendor downstream calibration.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
