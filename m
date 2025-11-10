Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42DF2D94BB
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762805076; cv=none; b=X9vGxG00PjcXURUspCQiEpt1OHqsOFi3S8GyKuhrZG2UQohLE4pNDqNn7YiK7q1qN/MKAFkCNktTxj7+398WeX76CI/QRm7mj2UxVzmoEx5EW3+SHnyRUUtIGTcCTPhWF59iuAZyCEqRc2lxxfVty/SdYM7Ysm536KB0HmWDzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762805076; c=relaxed/simple;
	bh=Fkcw2qew7eVStl/+jGAeuW+KaRb7Jjz96jXXyII4x7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qd1cjZhKDKtssV19Y/cCQEw0FDKA92+A6ZVmR2wMypxWSF+Lrmkm6fdR9n6HVPPqeOTRg7V7CzdVESJeUMrnxhoqLzHWRLvlUPkZZEb5Hh4ykXG0mzXIwrkdlr798NI0Y9cfnLBZAH4TaIW/2nw/kXr24PRPDhMIxpojloHm9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHZoEb+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0QGnCEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHZoEb+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0QGnCEN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACMute3306799
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=; b=iHZoEb+7rvrtIGQY
	ZdifNm7zQg6ObBnG36sLNVmkMToc6JglIPMxJy+j4phnAhWq8JdOK3rZqcOuCjsE
	DiVo5rYj7xi8eg/Un7A7vRRh3TM1+tSH2+nAdhMWS+qF28anMvbdkLpLngazP6wI
	E+diKjovVkFr9MyuLeBfj3Bei45WdSbnWWoJKu/cK0vruY7q/cX1DJpClJfaiUOh
	c95agm6xEj3zDG/f3oVL9T6UfIDhxsUFJ8oi6otHx0T0ttsMtMP4LFNPElBZx/MP
	21YUa7uKEC1qe8PF+x8gaiT8YwV8G/kYqHSFY0UlOInvwhnVsdGaVd/A0146OewZ
	NO3//g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q9cw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:04:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55735710f0so5966427a12.2
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 12:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762805073; x=1763409873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=;
        b=Z0QGnCENeqnBC1x4msz9V78SSG1mSFNbdjn/kmikSlDnYlnXKm8Aeqhw/9OdMPFs1z
         iTL1zaCInEyALdqvLpeesmCfr9xuvI2sxrSou8koyUZdfkzGJjm/BYtvXgw/2w9pKgWZ
         pX0MORfru/gJqioEwgfyADXh3k4s9rdBmzOKiWfImfzBVtGZ0BKvdcSJu38zaJBWJpeN
         6yZto2mZCne0+LYE8r8QyGACS3KyRgUvpdmOpDnvJ7ZlyvYVLj7mHNJfojwk258c5TGe
         fhIkb3sNQUgnt9TXeglsBlvsk/yKEEuP/ahqh7Uu4isJZbt857fl1fXo2pVxSQykJrDm
         GMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762805073; x=1763409873;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=;
        b=P1F/OPaRlwdpwbxibQZKMKn8FfSRNhJ7T8f4+0UKuCD24SmIa/86AoZ9uQgOEzvqnG
         jIB0/v55k7Vj9YE//deche1VdHSxbZrB8HSxQoqFoWLJSlt/sF2nMmsLXPeqZZjhYauM
         IZuyqTGUyaCWa/0a/57+viwMpYS6q+X7cea3sg8yYVe/ePa44lU1Ba8+fPU1hO4OAS/2
         X0y6Mv9jeCrPaIg4jjlTJJqGcXrpaGCc5aUBD5zUZd2TaOOKNt98++qViS1AQqwFG/je
         P0YigNE73HmXz9/G79gD7tBSwFcEDGDV6cP32G1e1zNO2Q3K/8yx5IvLA6gdI3Nk1M7T
         i4XA==
X-Forwarded-Encrypted: i=1; AJvYcCUmGnjg9v8a8KjIs88o1CU2X3F+jSkRPS3PRAj88lroTzMA6SL5mgwKWKyUknSUT/oqSc52nG0wa3YmPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbaF9wFyeGnk5jwxVHkJeODD4BPUs3ocqmK3DOPD3Q5K/YIxS
	UrF2an+n7M7ltwAQZ/BZVzPLIg5M9Y0hG5IlmtkTMxbq/UV1S1Nhi2LCAC/8CfjJ7eLtkZmlgxi
	f4+Vr9v4BuPmFEg9R74AxuPtLzM0DONgDoumrmpfg9D1ce0qwbK0qGd8U07TFiQ4Mqw==
X-Gm-Gg: ASbGncu0xYdC6x96zO8sQP84icYHvfJu5BZRVe6ceNmzP3BlUjTnuajlwpvPTWhFZng
	OMceY1cA7hPM89gIUZQOtRna81IVEZm95wQw3HOb/J1+GnFhZ02OsETTopkE6T1glmvXdE0b7y8
	gu7LLiunkwNNOSW/hefXJAhsM+GXwE/7RNLz8DcQoMZsZDSm/+909HNA6vBXbnhc0LsK8cRKbjc
	tfsqSz1Nemh3tVR+BIIOPYhfnicBwSze+jEwPf1vfayARGMKmAG/MgfFzbyTDQ/nPLrwugXv/Vh
	CwBHcgXGDUOdiKFtgtBh6+WZKMQvCNNI8xCeoMsGUnGCWteCJOcCrJZvIn5KMiIKkdAJ5uPdIEe
	vjHm+pF9Fdu+YFmlGP/jr5GA+9b45XOk/aar5kP5pl/315U/+NeS42yS3bNnc0osqxw==
X-Received: by 2002:a17:902:c94b:b0:294:9813:4512 with SMTP id d9443c01a7336-297e540dd6fmr127849635ad.3.1762805073099;
        Mon, 10 Nov 2025 12:04:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgRlu+QHDT2qRkN8FN4ZfcELPFfekO3p0qsOXqvaypumnws68i1D7DWIV/z8geDOvCYuPmxQ==
X-Received: by 2002:a17:902:c94b:b0:294:9813:4512 with SMTP id d9443c01a7336-297e540dd6fmr127849065ad.3.1762805072440;
        Mon, 10 Nov 2025 12:04:32 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297ed6808ddsm81285505ad.17.2025.11.10.12.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 12:04:32 -0800 (PST)
Message-ID: <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:04:30 -0800
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69124551 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8
 a=V89vUnNgf5GAzAs4dTEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3MCBTYWx0ZWRfXzwTSB1iQd32m
 6vVWdxv0Xcrf1L3N+wWn+VGIlUlEqdVmSR8CUtQxT2PfchVyNwc3bJ06X/452a8YNRHCsGU7SF/
 zSlTfm17sufEvINys3LvszD9AGC1bvALwuSJ91LfnugtXZDY3Z80NB0UhTA0NXhVjcmWl8ULnvc
 NvsNAvbLI+Cerye0DFopW0c/8tVJnpYfREoGe9aNh12topdy4x3Q6qFkKfYy5SrnpBEkCqDUGGz
 66UCXzDOIRKztMUYJlhaAxQAEh5tolF2/XtwuBMuFwEK68eBqdxprxQvcI41bHI67fonFKCULwt
 mbm6Tfg+psc3Fuorww+Nox/eAHrf+h3Bt+nOa4ojZ0j6E9/lWf8a9rcO7VRDa9NJR/tYpP+YaMf
 s3MApBBsL06BzR0UOoxAK0LoxRGufA==
X-Proofpoint-GUID: oLoQJZosBixsH9hTMDFriDdfcvuQ1EuM
X-Proofpoint-ORIG-GUID: oLoQJZosBixsH9hTMDFriDdfcvuQ1EuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100170

On 11/10/2025 6:26 AM, David Heidelberg via B4 Relay wrote:
> This quirk is used so far for Xiaomi Poco F1.
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> I'm very much open to suggestions how to solve this in a different way,
> as the original discussion thread got quiet, see
>   https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/
> 
> There could be other devices in need of this quirk, but if they're not,
> we could make it compatible specific quirk.
> 
> Until merged, available also at:
>   https://gitlab.com/dhxx/linux/-/commits/b4/skip-host-cam-qmi-req
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Amit Pundir (3):
>       dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
>       ath10k: Introduce a devicetree quirk to skip host cap QMI requests
>       arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
> 
>  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  2 ++
>  drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
>  5 files changed, 22 insertions(+), 3 deletions(-)
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39
> 
> Best regards,

The original thread predates me becoming an ath.git maintainer.
Just for my information, is the firmware and board files for this platform
available in linux-firmware? Or does it leverage the files already present
from the original (Android?) installation?

I ask because the alternative solution suggested by Kalle would require
modification of the board file on the device, and that seems more of a hassle
than just modifying the DT.

So I'm personally OK with this suggested approach.

/jeff
