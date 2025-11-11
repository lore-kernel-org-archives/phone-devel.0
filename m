Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D43E3246F8
	for <phone-devel@vger.kernel.org>; Tue, 11 Nov 2025 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865223; cv=none; b=qOxx4Pxp8xM/JfL3vu3Rc8WMIZ2hj9Ciz67b+YXQEX9qMHg2OB+pWBk261S1gOcVG/vdtSGxXvZkia8LQP8Dn0S9eYtbz/1oYqie7fN0DXvhvBD8sPxG5z7krmyTUmWPulgyJChvb4hJrQ3OTjF4jfJG5lBU+f7zSEAnXcFQzec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865223; c=relaxed/simple;
	bh=vI2c24xcDfLO+jj774i6XGCsjUpNaRMZS3K8xPM2Qr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmXSzWEU3Cf/h+6TbI6W73Edu0Jkp6vOSw/frobzT4sbOkjZv+0Q2N1/6OMl+47ZmQTLq+khBHNcypHC/Xjx7pgluH4zqWP+oxcW4eQ3RoepBBlweqyDUyq0jIkwH290EuJz035fiNY39xoVAlrkiuwrptty3EofyLZ5tvcxzi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQfOSgYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isCtypYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQfOSgYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isCtypYe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGFpV2051440
	for <phone-devel@vger.kernel.org>; Tue, 11 Nov 2025 12:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcgrCPztTJBR65GQBdHRM8vG
	IBP891DcZKanjQPvZlk=; b=OQfOSgYRI409fge3xzAPl1zyGh1B5qggKlE8dJ9t
	7tGU0Iy6M3IpsQ7petXXseFGlD8E2Fjzu1/UXXq1xmotBXJ5PEtsxTlwh+OpV69g
	Jd2CqZlRGXOD85TNRmKFGa6jgJYlo4dTgpQzM0kN51g6l01LlZbs9nJgpmTbTEOz
	oYFhm6zy30mLObmBJyMilSLomeqaFxxlToA2AzNdqKBQSei/1kKkOr1TJHhaQZNk
	E9It9O4+VrxAYgj151rDfZvzTmVsj+kMyPO+vGzD7/jnRhEGQRwS4bIvJnM71qtB
	2AZsIUQWQt319t/kgHlprzALrj7ARmEAacxX0voP7QALMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x0u03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 11 Nov 2025 12:47:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb927e4deso64392301cf.3
        for <phone-devel@vger.kernel.org>; Tue, 11 Nov 2025 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762865220; x=1763470020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=;
        b=isCtypYewDqx3Xqp1Bie+YA2n4Eyke+4xOIX/aZFBsD3gA2z4Wk4IF9y5QCwDaLbis
         UGU4ja2rWyGTu/6AHSU6wfIiOiy49fgQwZzW0kswmv+LIgHNgR02BRX1cSAzSyZqSLsU
         72C/z79D8CbBbOBaVbtj71iYPW5eAhH3Mbajr63n34e9xvRDY7PAaE68vMmV3VJ64edK
         UuswBH/pW5E91NcDS2IX9j9qFXVofF6ZrIKCoD13f83xhWo00FIX/aIoSgaOkG9GoVzy
         uFb1vNMLvk5CX2A2GVttLGMionkbk6q5l25JZaafK4DyjtQr7velDN8kYt87Gss3V+D8
         JS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865220; x=1763470020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=;
        b=NnfcuSedvJZ4WYd4CZu5TLP3Jpc2zuXEssINV5u5NflncGE167zdqRvE5jWNRI9rdt
         1CDRRg9cv2rAMSw9LugZwzU3kUR1Jagab+M1RewtL07yFU5RXygbYvaMZUg3yCoUQ0g+
         f1uJUszwfk/8hcn37aXxfAFduqaLDHLVqwMEcw4WpLTMBWOFJ7knrMC3/nLqWdy9GPne
         iM/WGsn1PwMWQ9A/lincF+U9zi9cVWIDTX3IKkv0Omzxvv7cuPumb+BR2EVIUpbJfd3D
         iAUAGHB3fv18sLecniye/whH4TqAUhqGq/z4kXOrQXlC9pO76yyhGI0BbJEGbZ1FPwQ3
         X4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUteRZ/a5LZc+930Dm8grgLmCSwEiFKWW19qDKNsSgJmcGNrK5wrtef//D4Xe0AMuFjTDXH0hNNbKMhew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/g4n4iS1aLsjgnA+1EeImDJEqzPAdplBRr52nlohVdOnnQacb
	2s5DborKcbty74mER0f0dKDmoymf9Wm4fJ0QAA4XACCdnQDPhAY8JCvHgVt2rkkr2IdPTwAdWZP
	12S/J5A5zg9z3hbmtflW7K0HC5YehhCbQPfnN2NRHPKHRXgF2LBIg6LR7+iwylXih6w==
X-Gm-Gg: ASbGncsOy1fmcBbYaiZWKrCA2d9Q5V3gfPHOX0Tpw0B9/JnnORFR+V4BnqBir4wa/zP
	RRnr2QBLipGhkcxeBf2UHj8WXcFdOo0UNTdtsFRBTBJf/Imzdmv8eJfp8OWMB5Sdvwnf1SAwc+e
	uwukyn7f6qsqXv6V/74LeZpSRFoYOEhci4praYyabiyb/DV1hYGzzqnUQlybkG8U40+p3BXBVWG
	KgtqS7iNttBkFOix58zWrhntKM+j7wHy1BBfMX36v1yVsMQjlIKPRNdzaW7gG757kHEaHV1qDcB
	YZBvJrMOKOMaASsgZKfR3YO3mFMs/PUHdT0plw3ZoyAP/Sm6YNtm6GMGf0STOTSgkyU0bvaqe0B
	xOD04ViS6Y2XOp4R1/57o4DcORhOyzU2BJk5RECM6zi/+m/AJ0p2fA/I56/1giVmadcMXzzbdls
	2WIzqjCtRxXjvD
X-Received: by 2002:a05:622a:14cf:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4eda4e8ca02mr155999711cf.6.1762865219514;
        Tue, 11 Nov 2025 04:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhAlncYp5HpdTxD1HrQnjF1b0//yHkzKS+jDNKrjtjAklFMPHNI+T7aD4cdfUGmuDLd6rdcg==
X-Received: by 2002:a05:622a:14cf:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4eda4e8ca02mr155999401cf.6.1762865219022;
        Tue, 11 Nov 2025 04:46:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a39eb32sm5013667e87.82.2025.11.11.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:46:58 -0800 (PST)
Date: Tue, 11 Nov 2025 14:46:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add
 firmware-name qualifier to WiFi node
Message-ID: <wxvtfyfdso3ngqvnhvryeo2w6udoolfp46smv2r3qny2cl7n4o@iawxfnj7qtrw>
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwMiBTYWx0ZWRfXzV+0MSgLl7xX
 aO/SVLWRdPMlnozha/zK2kilnMQkmM/m63oW67HkKD/53f1B4sWbLfcry4BO0LEbtH+ZEin3Pqk
 yAyeoX0EGH+k400jYmSx3YMy3XeyvBMXFluxss/WYbR6W0h4kIHp0Tf2bX1ydJInaiWwE7hXMGN
 1uB0O8AmM1XfP2KEiynIUYMdfXzwEIGLEfjZ2agd78J1BI4L8aFF669gSAqL9z9mfoEOrb6pKfY
 Jz0wVJKazlgz/L2FJSNAdi7e7BD0dVNsz9jbBSH9FeTScxxxRCXWA7GJOrdn3zR8OqdB2HYGklU
 uhEkgOK0KaOI6FO2Q5BMb5d2gUe7hpOrxwqGlFhE9IvURJqeNepUT1TbISGLKv1EliD0hsbBn2K
 6hvGGCFIDLR7X20tEmFWnwCDegO4YQ==
X-Proofpoint-ORIG-GUID: 3g_MF3wMJE3Iw96JcRRnh1Way44DNX67
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=69133044 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qG9Bp93c0gXLeqlDJoQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3g_MF3wMJE3Iw96JcRRnh1Way44DNX67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110102

On Tue, Nov 11, 2025 at 01:34:23PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add firmware-name property to the WiFi device tree node to specify
> board-specific lookup directory.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 785006a15e979..9b0b0446f4ad3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -631,6 +631,8 @@ &wcd9340 {
>  &wifi {
>  	status = "okay";
>  
> +	firmware-name "sdm845/Xiaomi/beryllium";

This wasn't build-tested

> +
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
>  	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>  	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
