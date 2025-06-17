Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E33128C036
	for <phone-devel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195062; cv=none; b=BjKbIPUHbrbnU2buUqt4JqTsKuBkq/IW4D49QwjMR2dOZI2Hj0o8wTcZLp37dyFYNh+Yy0FE0IrG8ZUpODLHlXLfx+E+RFfvy1YOR4WbK7o1yPTQ5JnIQ41bCpK4DUxW7MDP5GgXRjU0LhsYuN67HMXBbzE2D4CzxiyUTZbidm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195062; c=relaxed/simple;
	bh=Oc3wFGHZjYKe6oz/Y/IvLBiaMoXgWFyYaPfVregWfSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4JQioIuMovetsKKtTpLZUXkbYKwuSpXUjXTYxycfR2oXVpQU3FUizONrQ6uzBkWYDH4IZGs6o0JND2j+CqVHfKCGFaTjb6QDFLGlhAVE/uy1iSnKJ3/yVIH/0Ijqa5TL2hpYr5npmCA5gOWMmV8uj8jHKs8gkx9P/KqurklcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLLjC4fq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLLjC4fq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDjbmt014509
	for <phone-devel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2B96TFx/KL9jzZyjSrVip1zy+zPM/f/59CxS6xFHzE=; b=MLLjC4fq+VG7/JHX
	Tzb/Hp1CI+Il6vu2th+V+EVEuMOSzEiwC6EaZU892T60l1TmRe0JvB0DelRiLQkl
	ulgnaXV8OwCa80GSA7pUzjrjWUdJvhR5suyuTWcSt+KO2hegZQMbIE+kO/nK7N6g
	puFW2MeZwehuiHxqLCcJ67frG8kR95Erfhb7mdwlJwU8fbjtaYzOlR3qxIwiibbV
	ehS0w88xM3BcPkuwL05Ws+bGt8OZttYIDGNRdqRzO3tEBiQBB4MaJKP+2h3seXx/
	XYXifChGbktNduo+4II3nApP4Pb4VG6rYfct6Zz8emD7WptQIDqYKxvDIDuEa0KY
	F9umNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f79qt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so193142285a.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Jun 2025 14:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195057; x=1750799857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2B96TFx/KL9jzZyjSrVip1zy+zPM/f/59CxS6xFHzE=;
        b=ewh/ww83jIZiXKYlKC62PgQ4lfyo0pnisIxCkRYa1KgF/uobQGyUj0sAWkNwjGei6y
         aU0sqt3qXDnk9XDH0Vnjavdlv0SWpoyKjQWl0q7XATa7JQnapUoM0HUEK0fCxv2xDHNn
         aNEVXYK1nl41ips3IZnH3hA9SQaUcXBtvOWlso81zNfFELs07ynNkvdIdj6YIub8H7T/
         onOynbV58lE+pX6mi3JE+Gr8W7TGApTCwDfeBJ2ZveeWwQtypt2bNOCGZRlSTOZrKRVn
         XRotcqKYeqD28C3CQQyqir0ZeJXBREIGyoll7m9AHFBwp/Iq0SlpbP5QQdIjGINFyqBk
         T1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDuN2cl1mQcVI9lVV4tu1q5CgFhiH71cuufkHoH1EsK/Q6VlVpUpvdvfrYISNQAuDhzCsLO60Y4nlG1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUM1g4FdB9gyrlrY9qLTbGMYG6nrXNW+6qJa0d4kUv9+BR2S2
	2TmqNLEtCAOjZQG4A2dLMPHc3cANBHA+owJuS8t3G33lKo+yvmjtU9eZPdJarljHI7QVyB8e7/S
	j0k1jxhfnTDHk9mQKsd1pHwCwQH1OhNOwKAdrtzV+JvPbS9SZVE1iOu08H0Y9gyf3BQ==
X-Gm-Gg: ASbGnct63Vra9RYrruaMnJNOqmiamlUEwPSjGuDJkcjzbk1RnncTSGrDIgRjblERHHg
	6ASaIlf9v9X31a/k7TskIucLSVuV+GK25n/Rqn7yyL5aGv8EMFIfsIOwbUCyD2mfsoTjuO2wMY3
	sx5oPMdCZLRFaZ6aW3EPF0qx5uHxkmqn+szqPZY2qXz/i4LMIMB9pVymJ6zYltzfQQHV8solJZV
	RLgjCpbPvwf64WKReT7M7Gp4gNVepDNnjT0KMe02g8PXGlb2UsmdnaL7KShWsj+TqsuisZ03AgQ
	nT+q/xKxIn5n6POV+Fv+pfVLsSfZVK12m9CamVH3mbQ0YKTCwCi9bXyX10L8HXgKAUaaaF3IKJ0
	bH0w=
X-Received: by 2002:a05:620a:2a04:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3c6c17e62mr872990885a.6.1750195057603;
        Tue, 17 Jun 2025 14:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuadPbrh1VUll8Di3mBOdCudw6vbTTmMGIJ2ZdldP2NKImhDqIStGDB8oViB5MQ3gsuN40MQ==
X-Received: by 2002:a05:620a:2a04:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3c6c17e62mr872987885a.6.1750195057185;
        Tue, 17 Jun 2025 14:17:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe514sm933483166b.79.2025.06.17.14.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:17:36 -0700 (PDT)
Message-ID: <c2e21596-8d94-42c0-9a21-f77d510a8cff@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 23:17:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8976: Add sdc2 GPIOs
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
 <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3MCBTYWx0ZWRfX5jPxlr+IzEZB
 Y6bGg/LZKKhqqGbHLphRmXOKSFL3MVvKfDu4vZw5W9TNvnpsWPQxVU7rIDKgbWEAmeNjcJ+wTLM
 S7EUsoJX7nOt0XDafwg7/FsbQjp+ieigMf2Y11vZ2JBSB81oq39TARdJj/1XEGvcz07ruQhLqMK
 /AlNggasPnOB2A4IuwSzUQ8d0qSDeYj6dNnKkLDIyH0Jxl/9R+6osDphjYJAyjO6fggeKx41PK1
 Bxi1v+FSdXfdCPwaGuMUalGu5CyOIPNPNrtBwKbWCu3p6HRVm8oy4KNgGOiJ4wiD7zpwz8z8yJC
 anAJUlxBLulwQGW4IuHjVrs8Z0zxa3hkz7KPveW9elVhCW0EJLfU6TfBwFB1SFJTl+RnnfLvD4s
 zPuSc0h3BsccBOQ6Z/YavsVhQoZJMN6xdny2m9gtN/kJWS01NDcbWkvXXGjTi8ULP2O4ZSj0
X-Proofpoint-GUID: CTXf9IOBfV4PEw3BZTfDo7ek5uzG9bzj
X-Proofpoint-ORIG-GUID: CTXf9IOBfV4PEw3BZTfDo7ek5uzG9bzj
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6851db72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=moa28MdQsDLXcwDZZloA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170170

On 6/15/25 10:35 PM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976-pinctrl.dtsi#L223-263
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 2a30246384700dac2ec868c6f371248cfcc643fc..f9962512f243d6c1af4931787f4602554c63bb39 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -782,6 +782,42 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>  				bias-disable;
>  			};
>  
> +			sdc2_default: sdc2-default-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;

Should you send a v3, please reorder the bias properties to below
drive-strength for consistency

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
