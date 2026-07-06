Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D241DEE2
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339223; cv=none; b=B1Z32IZTUxPoGrvQf3n2vgfr0hqzRkIi2bNcFQEcQkwaeNEST0Z7tHsvNHj8jtLmlcZZY0V+X5uQALlBLPhBX18EP0VdN32in0yxNozqXMKvY1OKUqEJziQUihtY+ZwPeMLrJzpO5mYOV6orEbvnXalAm8zPXZEXQyjnhkVd9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339223; c=relaxed/simple;
	bh=qWTjPqDLGc6UFeJaIHNML9p3hZ3NmfrLS1LYIRLfcw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nsl566yG0dNVXIiYhq9ep8a9mZnhzAsSIr3rtQJDc48Rw/MPHwb1Xq/hITRf5JHcVk4mOhe9d4S4OtfISVld/B/VMdtRCmSEUDI3DK/BQyFUijKzAIHjtIklbgvGKlSlENmiwR9hjXdYhqcBqMl5fPCGgzJ9oGs+QPSE6boAG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozq9EFv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6hnkwAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozq9EFv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6hnkwAH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax88e391051
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 12:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=; b=Ozq9EFv4nHOcKDUf
	CqObyb7p6KT4C56FDXh3dGzoMPhZf4ordV+J6wvdxaT1f8bzmvWIUyc07mgkQRmY
	BByd7MA97pMop2XZJkQagSxMjos1eM+C8dxFyrfH+JxISYLZoYEcElZdzj3kH3j+
	in0TMY+Y1w+XAkTZKPfWLogORp0egMHzebFiDQtJakRApCNkEZG2P8xn6qN+CLwT
	zr7Yg6qlFIGB6sQ906nIG1hbgcRRVxskawFnZF60Y7dVCNohP0SKPBDbbD1+ED8w
	GdJRgQjiRs0InRxwkGRajn6oFk3qnDpqfRA2uVHx9ASNYBB1nJkRa1nk2JTXKm6M
	nlfmhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrkfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 12:00:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9c0c4492so68239485a.2
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339221; x=1783944021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=R6hnkwAHonvlg8sKMCWsYYNgwuUidYtMtcxZv4y3nLC7Cy7UPN4E4/CyJg4oxGVU8g
         e+MNQDxNZIWxLX7go3NtqrRlC2p+IV7SnAshHITViQ/PsaL+hb47laf3+JZwn95BatAq
         LmvxUfGN+RmxAwcVXFh5Gu8vsSZRvUccGrpXBDqW1JvHY9MifNZ9KCvtHmRBd6VNmoeU
         Dk4wFWCNz8p2ETwYxX6P2FyucgTdwo7pWnxyzbB2az5h6qKu+vZLHK1XgMRf5OobaC6s
         VsAzATifpEofb2lm27Kf6Bk/Lh0B7o8KCjFIqsOAN+zDjSGkC0H7SfK60Vyc0foyqs3p
         Wy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339221; x=1783944021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=Els00iJdqEWbXbooxP05Vv0rLS+dHZbyjRmPby3qyGLUvUpYw40oHf6io9F7GcLZkx
         LusiPtu+i0TwQvbnDUmkH5u2aV+cgEdrgNjdnafZ+nU9EiyMtBQGjAV2yhaMc8DvtMvY
         TYkFvA2hmeyQSkFWiZo8lBj5BO4R1FK/16ZihdD3T9Cb2MiMWXMCNRQ56NQudoZ7VtQ4
         iIXwo5BXDUYsLkDYuOLGLI8Jux8DADA0aBcgkDtfUWO3QZeZgxPqVIUXSQM2tVbdNMay
         MRnCdEa7GFGeZUatOcJPSukao0XgWLwWM8kNsHpEWLZBPq/fc9yzwR9oTQC/KN2bEq6E
         sMcA==
X-Forwarded-Encrypted: i=1; AHgh+RoTCwkikP17RLahpK4TUZBTqRJNFQAyphB7IDkLpgIXaqfJgp+/08w+RTZJ8SgXjbEkEepq3pb6WJT7QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WgxV3SuEP1S75g5yJ91lftP2BSlaX4oxKhfzZb6d7enm4M7U
	Rb1Hht3JJPLUZ7eDqBeCbE3Rj9kR/G4Ig+MjslOvFsQGDocancPWCqS8dMLbKPnZQbn0BpM/jyl
	aQ5anErxR3Ma36d+27wIF5uLAoJB6Q7m0Nq6iGlpbbddSF1KUVFWE2cMrQDbCPUuBpw==
X-Gm-Gg: AfdE7cn/DvMeh7fZ6Q/OYCoHRgHEiiTS465oEi+P6qrJf8BgnyxY95IGsztnpUDlKDh
	/e7uXcjJpYD4jOBrYEV60fYuvI8Gzr3h2aUZ3rOmSc2OEolj6ZGRr5fIXkeCrlnHG9BxGoLtlSE
	6KEUiX3jtXTPK4BFJItu5tVNKHGTk014/VbMo/LBtl9VCWyM66rDFRkqks7wEdnxPQ2ydFOkvJf
	InrAU+mNcEp1AWPlnuzQTPFNS1wB54kDBC2aqJ7B+HMpJ2s9fxDFJK1SawSKN1gImlw+IsEiJ8P
	qp1sdLHbcugUGpS0F4DXjAGKGhJwCEK2cAyRoWkeOB9kpEY4Mmw3WeB7KCvUHAECIVoplidHcWR
	bTMZ/Aj/sGQcIw3we6YiSz4MoxqtNbx+94Kg=
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945874585a.6.1783339220509;
        Mon, 06 Jul 2026 05:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945865585a.6.1783339219863;
        Mon, 06 Jul 2026 05:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm726569366b.19.2026.07.06.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:18 -0700 (PDT)
Message-ID: <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:00:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EKzwZsAdvyqwhbJV8v9IhJPGj_ppSiPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX9d2Dh8N/mdOo
 inQlPhCK2zWKqavP2bJSJEbGbxcM000nA1O5tnU3k8z1Y9qpQB6l9buQNevf/YR7Bb2Q9ZBKcA6
 fgrZabAzmsb0QXkhzxZHtUB6Jii4E2PwIlw3iSGNoDN428zknGgu+lNeB+KIRlJCVs/Jwj5ggx/
 K71GsEshZZaOTOBW5SawziTQrKC7AzlO/V6NV68xl2Udajtp0ByKtYbtLMZspAzIjvjIwFmr0Tn
 NM19ljl4O+RtOFjoqpSg5PEY8/qDOytz0Hv0McEoLeWMp5GLR48bDrGuuyvW+YMz36+xnWmMn/f
 uY4knSnlmKr143emr3ZHjHJbTnjUqNN/CoeaS8QMNek+pamXrPBZi3jb1DUWd1yArBnIT6BAroW
 jQTQq2gzEWGIsvAJuwjBZHvFRQ4uncfAjehLvOVT4265rNT4+uVad/h48DCCXP/oUpFkzl60CzS
 j0pIbgWWEgy0cvI93+w==
X-Proofpoint-ORIG-GUID: EKzwZsAdvyqwhbJV8v9IhJPGj_ppSiPk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXyBNP7miLtSZ0
 qa6G0U09picqKv2bF6ZKsWto9dt1tNgu5vcyCeok73oTZR6whLz8RfIIqHQS22deXFKBXZ3/FQ4
 7Y5rSAv3S+bbmvn5+NvDRkNxrGBmVYQ=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b98d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1P2StzUqvI1H_hqdaE8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060121

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/* CS35L36, Bottom Speaker */
> +	cs35l36_bottom: audio-codec@40 {
> +		compatible = "cirrus,cs35l36";
> +		reg = <0x40>;
> +		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Right"; /* Bottom */

One comment's enough (either above the node or here)

[...]

> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	cs35l36-dai-link {
> +		link-name = "Speaker Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
> +		};

nit: 'co'dec < 'cp'u < 'p'latform

also 'c's35l36-dai-link < `m`m1-dai-link

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

