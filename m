Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1033A63EA
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950120; cv=none; b=gfwfiabwnZibI8Ao/p/pSUEJgT+SQxy9E1NjeXUWV/wsS+B3gBGY2hpBBJo0JTV3VuwVjY5b2AHK5GGmkHtWr46B+HdcfJJGk2sE7DNJbp54B085W43k6FaHwfTOv3gNRqwoC3YtY0H1JtekNsO3BbaFV3g7dR7TFLRJPlD7+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950120; c=relaxed/simple;
	bh=t+/M7AMxsNKyld1HAtAZFbOAFuxlgGyqxZN4bkv8jUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYOJsoxDapgKxXqvNVLU6wZ5By0GGzj8ODd88wh7JaKJ0A9BoTDPAGwzDJpWwhMTJcwrtbim31r+vlS2CGU31Zq7R1oJD4f6xygrf+gVx5yL3wA7n7JdHzZBKtMwYXzr+//5CfLzVUWG2zgwD/Qx3R1Scabcv/kQpl8mF76YGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoVhoj4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7dTltIl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoVhoj4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7dTltIl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHTWLV824255
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 23:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oE4PaYGzYaXhy8w8vjo5VGVx
	HqpQZf2BpqUA1vqR024=; b=YoVhoj4pcWBhDQSoJ9y54qnZ2oagcEaEQBRJ8+I/
	X9YZGMMI5cUt0E3KZuooc3Kml+lErIHZAPVv8xAlIKKYMCUs45dbooa1aWc38vtb
	PWaEioLICIbGlZzq1rgagUIqAaYYsD/WQoDVvxjrlP/aD5xuNFDWNZlKatfIZ1yk
	IBVrh3t1JApYOq4YrfK0knFv8jtToRl1HaCcUiNSddWXM6+UPHnd8sCmSiYDLR+7
	tkCfQE/vYth83uSD2GMLEi1HQtpClypGb6XksvPCru/YxNd3qj9fEQ9BiboO1Gqh
	PgioXehUA6KZgPXwiCYbP6xxhVv/aSN8QLmcT+U6SPKC4A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e13ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 23:01:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-947d40d55b0so5660161241.3
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768950116; x=1769554916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oE4PaYGzYaXhy8w8vjo5VGVxHqpQZf2BpqUA1vqR024=;
        b=i7dTltIlDIpC+15HQyHaoW4wYwh0N1Cm7mvK+UlblsveqLO79izI7iQVYpLE1Crcu6
         VdnYcq7w/3yvff6TmtX27IDkdfoMxtFxwgS+OYeUQiRHNMJGrZhb7b4OOyFjfJrTPGDZ
         UiFrIz0dH+S5KzJgU7DW2T/OAIMaAISUu7DsAvsr4/vdG8RW8Ew6k/MrebwcmVE462ct
         /Ak7uiDhb7g49m0b8vrgJxI8S1ARMhiPb3OGtXSQtzE8ItCbK7goLDrkurgImelcmx32
         pwx27gDUDdBUyzVwKp98h11TH2nTALPT+45qGrKhQJVXAjecX6Tk/tzzLTjeM8gKmJuB
         /83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768950116; x=1769554916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE4PaYGzYaXhy8w8vjo5VGVxHqpQZf2BpqUA1vqR024=;
        b=TNj1GNCyfnY31hgzlyqAr69D8CQFdBfyd9TEbHHVvECsXtCelYFdz/2c2NhuBtlGLu
         N0vXUnuUVS3DtFqxxEqxcLSILKIGqml/fp4PCi7UnD50cF8pNGG4GefCZTrSB6nsDtA5
         RUYtYrUvncP31k/b1ss5ICyN24mhEUaHhBfe/Ejt2Ea+44JT9k9CbghY5LcFF9O0pDsK
         IzoXhEFTQ+oxcidsR6f8iYf4VaIgowiGnyxdyT/0W1etAs6OnPQCev5t6pEMvjMiJIne
         CipHC8qFGoEEHVZDBKvGp7EDFFwqJ058B/rX2sp5FKgEh/1MLLR2NRf+K9sam3cBomKC
         2gPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKZi+/W4WtEKyOnKOi7OJxBX8tOvYjNte1TsrNa+ee0CuW86A2PuOS7m8CNojY9udAUcibyhBTeRYETw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrhgt7hOi/dd3w9YEWadOfBGZeKNj8G8GDF+c6wUqGDx69jsVy
	90nCsvg5r1KpbaSLZWP5Ht5Y9Z9FW4Of8EMA0EvyH/NqaAjws4mI5q6aHa5i/aUuWknEvX5ocnR
	PkPbukzDvfnH8/oN8DgF7lmzYpQOy047cxSSLzyxNcPjew9x8/LBy0K+rW/7bxepbgQ==
X-Gm-Gg: AZuq6aJkvEqSw0rWKEQYlco24qcSl2hwes/jhg/OS4kS6RrDbgs1yWIq5BonccvEHME
	9Ks/aQLJi8G0j+ICsL2jr7CwFO1vAKYexXXaBOkWwmeggPLiQ6CBF2lhbrU1uRPj7Suu6W5fUEh
	TbAyRvVIxJIckqpOPPPPjsmuIxoeKJV4i0XtrPMmCQP1wzNrEkBX1cEgwpdK5yVAY1bvRcDuzFF
	T3X9Qa07AQxBXVsYw0qH2cFGh/1bhBGFKU05weRC75C4kx6mJQjZWLuQtXTC3onyoq6zySDdQe/
	iC/UF26o4prJBs+EyvOYri60/pMsO+vdJaWnWnIQj44ZdVQOBM+SsFtg1dPLCQvD5jD4BI5LNsS
	RAT6GkxZPpZILSjZnjXQbUoj4PmLpxGgMMxfGhmtLgjA1zqLBmWQtO4Q2b9TuS9TcirP/Rp/l2I
	2X3n8xeMqeBmZRLDTwGixDA7U=
X-Received: by 2002:a05:6102:f13:b0:5f1:bdcb:f1b2 with SMTP id ada2fe7eead31-5f50ab55266mr1230891137.19.1768950116406;
        Tue, 20 Jan 2026 15:01:56 -0800 (PST)
X-Received: by 2002:a05:6102:f13:b0:5f1:bdcb:f1b2 with SMTP id ada2fe7eead31-5f50ab55266mr1230834137.19.1768950115913;
        Tue, 20 Jan 2026 15:01:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf352846sm4418101e87.38.2026.01.20.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:01:55 -0800 (PST)
Date: Wed, 21 Jan 2026 01:01:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
Message-ID: <b2as6rclyqawtwuhyp3zv42f2zvbgzsbpamr2znpok6fvrqz3z@i35o5vhbm5g3>
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
 <865f145b-2170-48c3-a412-a4f22fbcba8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865f145b-2170-48c3-a412-a4f22fbcba8e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=69700965 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=XR8P7VQPE8jAVp-dJUYA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: GyrqaEcM8_JqWttYTweRURE2_4hTAvYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MSBTYWx0ZWRfX8FfWEAgtufGb
 lgqWLxuSgLJj2P20FCWfOG5b04dDltGhTY9pXvEpPoExw5cHjg+9ffDfXkw/aqfpPv0JQjoaqpO
 QyUlmxk3+qPa5w04IblHvoTJ6sNJWbhnDnXkvELZxs+P7KbTeLbTz0xDY8T/bLFKvQDVQifrt4f
 kbk3ZupFlBZDo+fmRTYDQg/kSdYIDpCItn6e/b2i6H35nIZ9bvHqG7ioECk3/PmFwUQUuWwVxUP
 OTYK+qOtvhLTWrJwBXl4PX6uRSwEpIbPwRnQMqx6Z1JXzAKjz55ZzT+SQsBDBcuQvc73KmFPYrk
 j8rcy0SSY9MF9WS2xoryviClTb8pXr7+Js7nsRa4W30Ob+XNjscsWYMe8BPIVCBnujGBu6L7SaS
 SYjb4o6hVAxgWC7tVyfSyTSTlOJtX+W3soZbhiKCMzal3IYBlzmS3/NrvgTAge17Gp2+eQ02wk9
 mEMDx/RToKBg0R/BBuw==
X-Proofpoint-GUID: GyrqaEcM8_JqWttYTweRURE2_4hTAvYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200191

On Tue, Jan 20, 2026 at 11:22:51AM +0100, Konrad Dybcio wrote:
> On 1/19/26 12:58 PM, Petr Hodina via B4 Relay wrote:
> > From: Petr Hodina <petr.hodina@protonmail.com>
> > 
> > Enable the bluetooth interface on the uart6
> > 
> > Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> > index 68841e036c20..f23f9757a08b 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> > @@ -755,6 +755,23 @@ int-pins {
> >  
> >  &uart6 {
> >  	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "qcom,wcn3990-bt";
> > +
> > +		/*
> > +		 * This path is relative to the qca/
> > +		 * subdir under lib/firmware.
> > +		 */
> > +		firmware-name = "akatsuki/crnv21.bin";
> 
> 'akatsuki' is the codename of the Xperia XZ3 specifically, whereas
> you declare this in the common file.
> 
> If they all should/can use the same binary, let's rename the path and
> if they have to be separate, let's declare that
> 
> You can probably grab the firmware images for all three (four actually
> but I don't know if anyone has the XZ2P) devices, dump it from the
> bluetooth/vendor/firmware partition (can't recall where specifically)
> and diff the files

I think it's usually bluetooth_<ab>. Corresponding image name is
BTFM.bin (if you have binary images).

-- 
With best wishes
Dmitry
