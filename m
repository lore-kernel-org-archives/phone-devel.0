Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF12D0C9D
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154015; cv=none; b=uQSxLolfe766xNs8/wWdA0cVu+e9Vyl0V3KtG8Ad+QmZg2sjn0ScsoQRR+4WWHogLMnfbk2UAABBNypOw05EkciHSuUlOrWfZcAn/lM6EFMOtrQWK6wDo+LZPxa/rNnCiRZeaxHVG5YvmfIDqEcjdy0y5fDlsVmxPE+iTXKt9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154015; c=relaxed/simple;
	bh=JXSAZRFUj4/4KS6bbrhUvanR3/5N5X5ewMFF7ODmEr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u60m3tYPgqyVfXQow368Pp4Zq3NPXkQWi2k6fKj3xB4E69u9p70PBgKs6DRLlMdVJSRuiSIUsJ8wI68nwSmorEFf8d0kdsdjFAaTCOQFWzGVuEKR24cvsjW6SYjkV8ulwZ6IAtbZgzqcNJmmjuqszRnOhUEgIM5x+pt+9ey4WJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQd74dol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx+IGZsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQd74dol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx+IGZsf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E704Xq2509954
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=; b=HQd74dolg/TU3GwE
	isdVVR9yiqcPmWNqHKP/hCah9xLpneLiqx3UEZ5pORLZtcTiOpzFJFEGLdv4HdKq
	cyNQ8fPpXMabcJo/nc2VD2foKd7j6H6g5UUVOi5TKbCPnu4Z4jGDJhbp8dfnxyO6
	bsQLN+X5TctNLYKmbj6CFVioBVXF6vT7ulHRV9CebOZhQXwWKiMXDSdRN2vX0pSE
	n4Sbr8LmiRoExThb8yPc0Dp+V1GkBsQzDYdmpVaMhSgMhzHCHvKNldHorTbD4yCw
	n9UtYnx0Ns0M88E5CsGFAg55lye0GQufD3kRG2oDRFONarqTDi7NJyUgQC8CuqDf
	lPnf7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867sp1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 08:06:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso50278631cf.0
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154012; x=1776758812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=;
        b=fx+IGZsfZjRHCgyFxuNzqgVqSAlruYgNIsZmUh5D5hlp5aHJSClWTKqDJfSpugl1N8
         6bC9yZ5ybwGZBVH56fH1ehCzD7s4BQz2sKB676N7LIr65hYt/PKdJCk0AfNZJ6DmM/rc
         GDiKvOARmdNM0S0lyBdYko8/U13nIi33ECMGzDtidsMIgwCADKyKbOZ52rf8l243UAvb
         68z89Td5zZw4FSmvWwCWlJsBhP3NKPwNmrnEDBMW7YyGN+7NgWFoJn8hbs4o7PjkCZx7
         yrHbDsctkI81KSMrZU8H1i8xMYN8il8fT94p7NfPTPjYbFpF+Tc/3nwDT3L0Gytgv0Ll
         W4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154012; x=1776758812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/HPbc3BrdRcd+P+xFJI7+7IJ86LVkhpxPxus+jxM98=;
        b=Oq33RJHfFsCvD5bAIF3LU2GYRL6ccDN2bwRuGExJcpf0mzj5hoIooW0T5z+3rY4zrs
         4kFJGg4Yv9OM/30md9KPatfdAQinunMQmd6Tv+sL3TMZendv9c2AqXOjl7fKv83e7tvw
         pQY4ZMTy3fZdAJb7fr7mPQowcRt2xXlCUXH6Uv34wrG0EFjfUDqaXucKlOPXPv9LxXhY
         Zek9QZvPzfCxE01v+oNp2ofu+oBt8WsSEyVKh9DDicO5M4rpPTIew7IevtDfRGrRwEpb
         tWuvb3/WE8CGFx0UjNLJLabtvNFGY7T4dB9LBZCPn85cESC0j02+g4pgLHe4rdbjk/pa
         4Qkw==
X-Forwarded-Encrypted: i=1; AFNElJ/OpzBeU27Ez3S9QyT+jH9HdSTVt4VIOXdqoJ+q4fghd7RnJc6YV7RGeIP2bXzCE4NOkbuRyhgho6dxgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyouC/BLqoA6IWP287r0U7LT7FIConfOKbHHIL9P7qJTx3URbFB
	aM6YQU2Np9Frn59s/rtKvPRR1nGr5afBKmL0qDjLrXTnx4lkL5gbRXI9gsSu06N/dWQBGOu3eUS
	bwNPFnPvgm4OqwB9qaMz3/roaiKa67c48EqwGSxab6cOd2f0LG/xSnHhUxd5lf/HA3g==
X-Gm-Gg: AeBDiet+Rrr68tCR4rb7drDkXpFBplhubbZfgobZsZnvCqCtWXURNzcyeDMUoMrop7B
	4OsaLdvKbo2lZWRhzksuTr54mNSZLZGpo0ZmWJRWXlbtfpNcdV7l58FMxb0gAjNYPiDcCsndK2n
	069U3/ipVQ2pn5u030hNxgaSUq0K0PRi9mySzQT0R+46907zFVjJfrXBXFlqcFpY+U6Fqrc/GSM
	M1cCV2RGDw76G4QS6uU734w+rXPsErqix05uUAj9NU4uwcpOjHDoTAt5B11ZYV1ciqzm3HS63+3
	i11yfVr3rNa77CkvLWnv8Mz9mh5w4VjTa+7ZWWI2V5JbytLsboq20eCLpwTZw7R5Yrasute9Eqd
	LxCjFV6KrtTTQeuC3rUO6O2y17jGM8Hz9IJpe1To2g6aaKZUKqDBfyR/iQrFQVO1Jk3Y2qM0eLd
	wk7Uu9pQZSCV6h0A==
X-Received: by 2002:a05:622a:22a8:b0:509:219f:8e34 with SMTP id d75a77b69052e-50dd574d883mr159458091cf.0.1776154012413;
        Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
X-Received: by 2002:a05:622a:22a8:b0:509:219f:8e34 with SMTP id d75a77b69052e-50dd574d883mr159457891cf.0.1776154012013;
        Tue, 14 Apr 2026 01:06:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671d70c9656sm330688a12.31.2026.04.14.01.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:06:50 -0700 (PDT)
Message-ID: <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:06:47 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sSVhRSmoTilHk5jRfo5dieiNwgy31Qfa
X-Proofpoint-GUID: sSVhRSmoTilHk5jRfo5dieiNwgy31Qfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX5VuKLfKFvm0Q
 7KGOf9D1yW0R3M4SEMZjhGL43zu5df81SSmmWnYvN5hh1BGMKd9+c3NDURhAe0YgU7EyyvEOXS8
 7lfLX6esPXVm+wavi70EZhIgfSM8xQBFR07i93eIwpwhKJRtLgGwIyfpmvPrbtpnlkXoA2bNWTt
 5BkCXdDD9e4K0QkiYYzRwyGhkA7zbcPR7b/gVjC3xl7V6XrNA/+JkUnvuJ9QqYay5ZaK68udyNX
 Rq8m0qjMt35dUOHv4mQDoVH2XM1cVU3aDnUL3KTSx1KnPQVtAzdd+WUWSg3g7J9v6v5RfNFJTYV
 /p/yZ7eByxCFMn7t4uXEDpeAqN4vQ00J76ocJff3G4Y+tkcohFRt0wTYzVtRNI60uWI16MVpgJ+
 48ZP4YCMhb2Smyl8qvg56fciMf7MnKrqyb5w6Wj+OOPmxCIwW7wGhCG/zsij7fdUNjrDVdEubzV
 B6mwvnJOl6jQ8fbelzw==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddf59d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wxLWbCv9AAAA:8 a=d3x1nyaPrRoEkPAh3MsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> msm8960 uses the same clock descriptor as apq8064 but lacked the

This doesn't quite seem to be the case, some fields differ and
apq8064 additionally has:

QCOM_RPM_PM8821_SMPS1
QCOM_RPM_PM8821_SMPS2
QCOM_RPM_PM8821_LDO1
QCOM_RPM_VDDMIN_GPIO

Konrad
