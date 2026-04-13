Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348783AB274
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069423; cv=none; b=EB89WwY0K2jGi9SPapKHmY4Apyxnv0Ry/1a/tw0ZVcwa68LK5NsFrH+v1Gye51cnIreHRX+H+UkPN7WlOB3FwUDqB9fYtXTwbwBc9YhnKuSvEP0wXlCRIZH5or/OcgpSaU+1BuBfrBwGrOxdP1E/wUNPrdVxqMMf1N7yyFIqnq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069423; c=relaxed/simple;
	bh=OaoJFLO2aBVpD5kCuT2SFUReZuAlH6eEsf5E0yrjLPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChUu2YH1z4UJfKISUAViNNhUZfRSPYKuEc1A4vN6FuwN/atshG7HCYIMDjMcrbXh2EXJtxu7pICyhpVeIjoismvZiWX10TFUH/Dwdrwm2zE5s07+kN+Et/SW0dBXXk6JVyO3Qc44rqX3RBsreeJ3UHEXffN4BdxGF70Oz8Dy2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4kEE1Zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Quhp53+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4kEE1Zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Quhp53+j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6mCZi1058886
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=; b=L4kEE1ZrlktZkdyu
	CO4Y45EQXohbImpf8FQCvojNhRzSXqeqEV7nqmFSD74/n1leuEFPZV9aQhqv1jvl
	G0R3jVtPqZWfqe9HoNTiFhgvvCnwcgtq5f8gDmV/5c5RUvMlGINp0z8ZDXbLHAv3
	YKgq1lX/WVXpSRxXqI+g0K5tn/ok1BUJsT3Fqyxenw1KWmktBmTBNQxltoc4eIZ4
	3vZFNqIMnhx+M5iEWjUlYYPwAFzSDXitMbyOoFxEeBrMFIYwFdmhZGxm6UVBSt1+
	9rR3TUj1+HjxEvb9cCE/Xh0ULyGtRHjyWm++5wHVwOzI7pqOhi2aNrXUMDKJtFBL
	OlsPEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtmgjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4966fe6so4594646d6.2
        for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069420; x=1776674220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=;
        b=Quhp53+jrEHqWbx+p8UjVSr5CFM6MJ52N8QZ89DtJML/lD/37L1nzGhipphWLzwn/s
         Fbg+ft2Y7siVBX353zBovugzVvQbJOwARhT5A21C7iP9/II3vE/mCOMLgqYmVl+Wr7Xu
         rBtPNnbbWYXr0HdLwJPP+FRTMDQXXYqUsAZITVNUpRaJX954Y4x7+1Gwjnxz9z1b11dJ
         ipHd/KGjXO3RKoEnMGcwLuUgEwMXjFRjBW+iOfWVPeXRX0YutiZ832+qnhZGYjF9zpNV
         rxomkLuX+mQpUWRBchEGMDT4PGiv0xCIEHAzBZOoJQSjDHbqn7aVWYUFztyssw005uIx
         M/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069420; x=1776674220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=;
        b=TUql30RUJdoTty9hsJGpW/PkQIen5HsXCriQUcGHkTztTZrFBXwPCr2X4zeqU0vbFS
         tXirQqVVoS4bloaO1w58d3HVPoW3n1G5OpzIW5azNEa7f778Ej2NQHvjRqTo9liweKf9
         vxS0FzNt1SHYo1vIE/fC/xBhirs+hZVvYey/NF0bAUtA7tJXBo8X/7T9gqUDnsutgINy
         a6eEBnZ1VW0h8uFCiva0AUi1YxaKqAYWd3e84Az6QCvLPt/Qo+v5w670hHu8Hf6aunsC
         GWQazH+STsJsciQ2dt9lLBKwvFhJFkoaV91RKEMA+uolJxTCR+Z0HD7ZLtEG/W03i8QJ
         EG2w==
X-Forwarded-Encrypted: i=1; AFNElJ8VJR9VQZZUtYL9cCaYKBbozEAtVzqhHJontNbsl430JAHzQ9NgkM8viHDP0LGX1aogY3agMrte20UQ8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgyYwDUGDUu49YR3q5ELgTTna3V8Ur/H+TEYKNXO8NyhSEkHc
	AjIRpUEAw2lCxpelbDg4TBlTSaLIIc/6rUiKMUZPiFZX55adEU7pxBlps6CXjnJqbooMuZ2rihY
	mddll1QfEdJyq3tYRDn84Uo0hbYl4jjH/dLWuz0fdX+p59Vd3yAjIQLq/vCBoYS2I5w==
X-Gm-Gg: AeBDieuBVs7mKT/VDfehpGM/gf3b8eg6eRQhEF96ZEPN7ZSu4uc0m4FwawebaFymHTF
	g2ahn6kraj6SxzDoZHvdC98EYGLlZGdO1kRnKNHnji8GQfWEJziDCWtzXVRxCWozS4g7EbBikKs
	EHBwgm0T/STm7O2PnHvRocTBJoCiRGp2eJyZVSkCDMxhVOEtB8idcWRApiOpMHq4TxxRrYKgDSo
	K6naCgRV62Cu5JlUFZoaQrxIexerNMCtQ0GFrJLwDdQ2UmIVliPwzdFuLfOYPYWolFCF2PcvgRS
	lO8HYu/fQ6ZhbKZRNYfPmspqmobTVUFEIfNDBzq8EcSZRzkCXEHc35bt9l/G6QFwPu1vDXdS3Mo
	HHw+FV0H/aYhCAYvNszTXVuitR1Zd5qKWj01eVZVnQOULytV55FeN75zXCNPsx+CJNwN9KjYPdS
	/3jHE=
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr127314286d6.4.1776069420493;
        Mon, 13 Apr 2026 01:37:00 -0700 (PDT)
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr127314116d6.4.1776069419933;
        Mon, 13 Apr 2026 01:36:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8492sm295448266b.47.2026.04.13.01.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:36:59 -0700 (PDT)
Message-ID: <8d2d25fb-2adb-488b-aef6-79bf3bc1cf8e@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:36:56 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
 <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcab2d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xIeCYdN2kLphDQboBmoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: YT6fScnRTQlDn9cLx6MqIEUyg9k-4oLf
X-Proofpoint-ORIG-GUID: YT6fScnRTQlDn9cLx6MqIEUyg9k-4oLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MyBTYWx0ZWRfX+iG5zSIaZCFI
 JSSkaKF54pksJUm0FfI8EPnzWXrpT+ULvAgYc9/wRVGuCPi+rqzgKkqiyIo0JJvwPvUy3ovFH5z
 H1c/wY8UALmzYNKobzWsurN8J3rcLsQKCRRJyaO0HHT1O4nohXNWEaaJgnrLVIjUf8Qhpnxdzb4
 DdKF4HH2lAGhxTtwIDbh1+QYL1oDeDJ3boFrh3LtLQfqbVkRhxv8ECha6L5HOYGFYyizBL1ePlo
 1eUG7yJupQghHukN3kLuhhXp2/Q6i81R0Rdme9Ic9a2m3od1KyPt7LKJtXWu7S31Mcjn+mJoBdy
 pI5f1gens7ISjWIZB6cNKC5Z85Kz/GPNRXj505qLQhU6XgIBylDR5KQ9HJd9lYGG2PwmjQR8obm
 ifW5lWbAaAcvs5mHQl/upICfGzvRnF3aW68NN/+r0U+9xOTlNNmBXVbpBkcxHe6JP3tkmTrLgNO
 DrIYlfv0AHq7Lfi56dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130083

On 4/12/26 6:35 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe the white flash LED
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index 070023a9813ce..e9d9842cb8674 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/media/video-interfaces.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -596,6 +597,19 @@ &pmi8998_charger {
>  	status = "okay";
>  };
>  
> +&pmi8998_flash {
> +	status = "okay";
> +
> +	led-1 {

"-0"?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
