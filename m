Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27B6472F82
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148207; cv=none; b=eYUD3pgxrh3DYvxd8bHMrZdnZiNO3sxlxcypztPttXIVugw++9415qLeIqFBLh3chWQ/zoUw5PmxG+4KFqY8A9sawbUCVpyXWE50xBi6T1ITUUlqyNOxxuzp9NvuUf6IpvwtViuc+djcBYgQqNKxChfURjC2dMaK4GZWg0qrC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148207; c=relaxed/simple;
	bh=JdVdjnikGKi5Gvt+6lL8Ht9yPDN07pXQJkC104IlcQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2txrVzEZU//mu/t8ILe8A7Agt3YEe5r8Gf4zIeCyx/boRHWMvk7gmxsNGYNTIKGk77UOvcfE1CXQiLFJvZfIx6wGFrRb6HIpVZeKh/oWysCfwVaW10PNAKbOXDcIu0xpq3YmWuqYeVBSVT9oHhfWt7MYFeOUkBbEwcl1DnIb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfUVxblh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMFCox5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfUVxblh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMFCox5K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAPih488768
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 10:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7uUsi3m05Q14nZCoKuKl+bouK7Huw2yq6Mvx0jQTmM=; b=QfUVxblhl+b3cs3G
	iSzF/bLQ9EY3kfWIITCyNWk556Eq+OeW4EvhS3RkCb8s48nBwl0965GdVJKy7QRl
	wvarpKMMhzZOmIB3NNDzjANryhs5MEOkTjXmMEGGTIuHKMZ0cGba7fWV4L+fctjZ
	lrpcaUHxhBJo2ol8E5JzlEQGP5siYIMY7eBM37LNpCju9cUiFlMzkbqmF+Uox7Q6
	HlkcaVuJvv6J5g8GFSpD6G5hiV2JDAYp5E0yznW6hxPWvbWxU37Yza2EpRzVfEL9
	GfnPA5GnnDs3bdmPn5b52NG53R/uMmUeZ35LSPkAUwN1a+RtQJuJen7R9P6qMbDG
	Sg8QuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9ge6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 10:56:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso117259785a.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792148201; x=1792753001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7uUsi3m05Q14nZCoKuKl+bouK7Huw2yq6Mvx0jQTmM=;
        b=MMFCox5KYukrxdB22k+9bFXeOyumaM6cDjg+QxtwOxR2ubU8TX61NoiNhrRnaj+vCQ
         1xh/0wAAF1f01vyZtCpEJh4Z6Qc6L4JgrFc0FuLlOaXcCpFcd5p9n7QMsCgfCKgXMq5k
         uXS9uyVDuWrIgjeinLPJJudd3FoJ1H1hEW07IPJNafQeolg1omrL/eeekVZ5iK15el/W
         jdG8Ym/NxyZ4e2ZuvKE+NAd/JfLPdCHAG0hvY0q6UYTCDq8zOfhXM4Ru0Pl24nNq9t2k
         mFm6bsEVUO0sw5YVDoup1eZ53/zIRvuiDSnqmWJy7qkeYN559eFl+kWZwuH4cXZBWRHw
         oj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148201; x=1792753001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7uUsi3m05Q14nZCoKuKl+bouK7Huw2yq6Mvx0jQTmM=;
        b=BZfh0F9nWVCmLKVLk97uMb+IN3cTOpXPtBVxovtZHDaWvVsmbA6DY7CfjPVLbDsncz
         N3IlBKawbvzF23sh1TyPjXnMgKp3p4neUBC50isspVO0Inta1Ir6bI34fLhqruEazsSv
         G5K0kXyJ+mb05/D9BkN8bYR+0E5+wGgDmiq6BYOZdEbSYNGy7MqckOwxR12FgPnMLyZq
         jYk1Eq0qgwWGXKYooTzm959zcjaSPNAI5CwKh/XpfLHV8uD9+3vao3rBSMLl4Op2G+7c
         6Plq5xeDqF3oSzfLWC9Bec5avevtS9nWBfPC3t4dP7WaFmmYfHh3nh7nC9EcFqUo+3sr
         2I0A==
X-Forwarded-Encrypted: i=1; AKwUvByNKYFH9htaPT3fws4N2NDLt1SJ6zYpNK8wPl9t07uRuYkcCDaMo30cd8C8OuVJ3uvvdzjv7tlMY/GwGQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLd+iNPI2etyfEZs+P73fm7juFK3aQ7/10PkhM0oSVvB6P/ndBo
	9z5rgQfq5KIK0RihPYJeDHNVWakvjZVGtEz8gJ14hpX/TInDqwg3ox2bSguq7tlpjugQBOmNFf5
	VfB4aDBiufQLQm9gNP3tn0rccRwPvSmV5p6TGLktS5n49ed4XxFg8VuNeR/jf4sI4WA==
X-Gm-Gg: AYBFou0KKTq3oIhcnhG696HjmJqizdZryXFonYobL6nkfkVfTwcKDhypo4ZvD9sA+Pz
	Ejstox+LRgl46wCmLmRfk9ft5WT7SxPI8+ryEvKNAMTCOHOUlaKYa6pji3RN+88SSS1T7UdG8Qi
	QWZBLKkCBsMCYceEPIaYSk9y8AsY77LHIgkpmNrIHbTHxa/4RQug21gFC6dyTOWOG5BV/A7REdD
	9EhVr2tCj6OTaNAfQcjrqxPICwBc03lK/dwHlD4xF21Otdq5UKqNfNQYfsxNq7z5UOi6dbjOdbF
	OJLUUcPcj4UAyvnYe2fY0ZGcEkSjK4Fcu7Q0/r+8cs328yuohnLxKWR+noKTQDy/otM/0jv7xML
	0jW08tU5lijeoJ4ikKOk1bA==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4141212985a.2.1792148200811;
        Fri, 16 Oct 2026 03:56:40 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4141209885a.2.1792148200359;
        Fri, 16 Oct 2026 03:56:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1dacb6sm780437a12.28.2026.10.16.03.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:56:38 -0700 (PDT)
Message-ID: <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:56:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MyBTYWx0ZWRfX9ZFOs1IHZVWo
 5MW/T1aUHgwN8dyBDs4l/BoIUc00QbHxkbqaIgU2VmlB3PQpSzfxphJ2BrqwcU9mQ2k/SEKciDR
 6ZBLcKWZXI0w9c9VVTQH9dRABZcje82QLDQvhjTVfQDsqbgne/7tyfBLxPefTVQe17wZALGV9Ee
 3mggvkn/QSziXzlSz49v1C9Q+mMuY9LAD1EnX73Cc+apBzQB9ytiD30uM5VicBlaXI5mA1AUrwG
 NU729hTUhn/bKSNlvIVxHqPgZd4XtLsl4RkZ+fFOdNnxsNyZ6Womq7Sc3tLi52otWpv38H6FejV
 iyP7u+5mLXVyBSuTYy0gpaczQpAsRZUePo3/oL26jV7mMPG16kJj+i5eSn2Zra8xOFidPyZ4H8B
 u/Q+F/9AaZdBPIyQdCwR6Rm1GjsddN/q/D/+JXdkQTYEmexDc1Zq/n3rTENNBS6BZ9b2TVA8vjT
 WUqzXfq/N7tXyjMLzBg==
X-Proofpoint-ORIG-GUID: cH80DS3-uY3n82oU5wWPGLHd_rfX4191
X-Proofpoint-GUID: cH80DS3-uY3n82oU5wWPGLHd_rfX4191
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MyBTYWx0ZWRfXxe/UJqgJrLeH
 y+ehpdwq5fow0v2Lev+l/mMrjYJYXhAIv0wVz6EYbo7Fc8YAm0YTXS8M2Gu7k5k0N+lT8UeRuh4
 MVUaAlY9ztLm7l04PVV3yEuho29KcIA=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad202e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2OUG9Xaq2iMWKi4sypAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160043

On 10/13/26 3:58 PM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with

[...]

> +&soc {
> +	i2c_17: i2c-17 {

This is not a MMIO device, so it doesn't belong under /soc

Have you tried using the bus through the normal QUP driver path?

> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

style nit: (foo | bar) instead of (foor|bar), please


[...]


> +&usb_1 {
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / DP altmode?

Konrad
