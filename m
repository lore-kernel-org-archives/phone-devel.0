Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54553A7F5F
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558432; cv=none; b=NCqiLzEVRM4zmoOtMr/MtRgDYJsEBwXZGfebpNvg+H5pYgqbIg5H0Y6Tnimnd7QHpWIim0J2MYy0ZxUKH1YRLOQvq8xT56JecAC1jzDsOmex6S7dDW6JlBKbV5f6RpPQ35VHHf5bLSyiv34Im8EE9Wlq3yzzrYZwa+k9/wpsNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558432; c=relaxed/simple;
	bh=A3ydXwomAr2rCw8QLiJCLbOQjFge804nba/zWwaOJm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJHokMhTrj3TDJ8I36XECL7BS8RS4XkX4n+0MgjOp+5DnJsNLXd98j0XTKCoggsV+GHIHRpfkFD2rDqsoePvD7U/z0kGgW5od+QjPB2/O0M1MOB8Mw5U5/t85vfW7Q0knOgFC2fk2tUy18/MTnp4vbGB0ZYTBZmPginMnwCttjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrPx23sL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4VtTPAk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrPx23sL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4VtTPAk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376QIUB2550302
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=; b=GrPx23sLkh18AeQw
	ov4ZAWjC0IkKxGiLEVl5NOxhU0NBvYV9W/x2BpWGo5PIzwP5g4TL7A9EyZTgE1hb
	Oz1Wc0gWZOQRU2jO7p2Wm4VTCxyp8jLQXWVklX58eYtT8XNgnAQckCaEadO6mkgw
	TRhDxwJrBriOWrC+XN5tuDQb1J4cn0STzd1l9CKIvS35u6YZxtWnyvuaSV1c/hu1
	IJTKxmeoi5cmcUjHXvS+JEjQoZ3iGmk7cOAsoPRpXMz65BOP/V7T4XevPgZc47sc
	NgwVHMGAdAFYdykU9XlU0QfFoLvFVQdIJIxEcg1CgKVRnJNTdwjqNioSN73k9jHz
	NIjIxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreabbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:40:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cff2297253so102192485a.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558429; x=1776163229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
        b=T4VtTPAkMleoCL4H/1CvTBNEcYwg9wxERxxdZ0k2jBwhAMNOsKk9ajAnSagkm7njJ6
         jPYar50lc+gyqBnlNsOwceU4wRWSt0g4O/CmKImh8N0kmMJnu8oK8lmpWY/I/0rqAZ/a
         nRaRwZqNKHb31j1qRIOrhzSwRC5Pog1s2pWVcKofRftuH3KVOXLalk5dKASkMMq5QRFl
         wKgYrGg1wSDCQbuDOBx2oviTmPZHF3tQAgA+f3yEYpT069fkwx1YKJ0t7uHb57wX2oVI
         O7pQMKHQP3bGEf8rXM8I09x7MeJLHlpyt4BalJwUWgMJhRSiod6xQw00e1L4XmyHnvJ9
         yzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558429; x=1776163229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
        b=oCBcIp9M3A83Aeb01RNDVOs5jqq5NAcV7Am8JUeOKDQEK736/X7+RseBGeLV0dev83
         6/aY6PdOoDEJ4mDO8kfkc6XIV3xga4y8bDP+po88jwTSj59FNC2Oq0IEBXB/LUwKheT+
         SnGBjwYj3OjMuP3mIEXD6zZ2/DDFugnrea6j7qkpb1UsKQgZPpkLXFRnXf6Fgoe/DDtB
         F4jNvxC2GzBzYXcKrgiRNRb8nWa/wOyhgCfb0MzCzYc99WOJEwJpzWZxM7l25UMAvuhB
         6YUufFhTNKqRdD5PR5VRXzUpTmaqtnZO98enlMvAgoh1A1vXdP0SzSnRfXgL9AtBRwDC
         qJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXp+JgFBt9oAAZdd+3WOPOo34Tgokt6Oe238xi/YTZIQe5/Y6lieV4CgaBmTx+7b+eku6K1UHgQVFbyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrsLqWteMfIlgM8pWo/AxfqzGQkHljzHC4xEtSy2HlBOh5zaAZ
	Z9+X3QeQ2I9AKeoBgCkXc2W2WR82qeyZnxfz1EwUkHG9u/+8m0XVa5sIoIWECsJJMzuTBxA3+rf
	6T+JJ6gQdS61xjvGpJ65LAGCQaAghRwEQ3P8ZRl0HcghAfW0w3fjIUqhLhfBqZNuEWA==
X-Gm-Gg: AeBDievv1MhydJsEt2EbgPyrdlHst8VmvKdLwTqRlFVnvUPS1Rzig9VbsxyIaMTAySO
	2c2SkTpEFMfyBaQhvOj1ksIplCvIPxZ4Tij0prtZ1hXadUiS+vDI2WN28uijEbp/jnwkqN3vDCz
	hv6+p1qUCT/EHPT8/oclDqrKsfyTKtR5sM7LK/IMdsvlsfbLYOHotGighDz9qiO185OHLp7hdR7
	uUkvEqygA1Yx632bol8pzVyOLezXmwIMfZkcNXMxm/bjdYrsy7SY3XfEpadf21Iy97joR/O16/e
	vvxycPOZDyEFt5tjgZQKOFwIJr+awKCxORs6EDNW9eMQTxmwC9mZ5yaLupHhxXk65w0932Mm2Rt
	2VwyZ7svojdjoJhUnGT/ktTqZ6JVJliZh4oYLpqWrnOdg+rS0W7JTUqWOdcTee6d0wp2jmfRnr4
	J298I=
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d41bbd4c0fmr1673957885a.7.1775558429236;
        Tue, 07 Apr 2026 03:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d41bbd4c0fmr1673955285a.7.1775558428775;
        Tue, 07 Apr 2026 03:40:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fe1sm4040978a12.9.2026.04.07.03.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:40:27 -0700 (PDT)
Message-ID: <623b4ff7-463a-4681-a5be-375ce6fdf90a@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:40:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v3 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
 <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4df1e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: ftDMbLG0U8DLX4T862YGLjefe90yv_DH
X-Proofpoint-ORIG-GUID: ftDMbLG0U8DLX4T862YGLjefe90yv_DH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OCBTYWx0ZWRfX4k4Mtlg1AJjW
 jsd/6HG3R2k0gBOprCFzoHQ6HJDHxvQw/7kgBD2wZ4s+lEHu9pGYnfkxf1WZOaHHSL1m8NQWvbp
 sNNpDw3WuYwQ420U1KiDZqjpcT7MGiOWViTakRjGtG95ck98pA3W5iugREv1cp1E8YUZZnrvkvW
 Y26ucCIzj5uvbaLbvDkiqFdjwezdcaIbDyLam5vjDRV6zZWMsBb2yXyed+Fn33Dk8lYo4Bub05u
 PyiiycCkl7A3DmbGtLGLyccrjHjVzRZjCUhLqcSQsBSVlq3R/XrncI0LKlTe0gnWqFJhTikMcqK
 EGlO4nCSr5RS2pkVCSmhGlbKg9qQy42jqUfEw7TQtTu0EQgsxvrGusF1zufj8V5+IHs1KlGpfuw
 /G1Iavr1/H1IKE3RspOpqDks0Z4txBR092AA1HwAApQW6pP6DuEhDNTtMBB11sM1ftZ+zwnA2Wb
 2aZUOWhNyYG7rjvCk3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070098

On 4/3/26 7:08 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.

I was really hoping for an advanced touchscreen!

> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
