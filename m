Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFED3D3317
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834413; cv=none; b=gue3lADT+cbyALHSHMc+Y9A9CO2Eg6UizxOGkJ4lEoY4sXIYY2XSKzQpPH3faHmaMcupIkY6Gn1Yhtb8pPLuQyNCBd5xzEnq+t7FiELhHcg9KNk9nWlDk0PRx7AMbFqekbLdGr331pS83TCSWbOMSd7Vinyj8mGbHV3uGEjUM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834413; c=relaxed/simple;
	bh=9VTykINqmCDu8R1QtHKOq25cYN0GnhWOv9xqmx9VG+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grk/bZ+izd1Jlw8E7G5mqreqR7XjvJtXcUOktEuKhGelvO71fatYw2gXFgm/AQPSeittRkkj9gjN23MRfbJJKJP/wkjgTcPcULywCEDvHlWQFwk/FhbI1CgEall8UgkH88QLmjGwSN9+QVbu1OyA2j5UG/qNNEqOHSoqxF6/WHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXlAX8b0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvpYsoE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXlAX8b0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvpYsoE5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi3nV008774
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 11:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/Uji+RduemsIjiUG7+YyFltf/mmFoucUv3L55v9doI=; b=ZXlAX8b0Nv9HWeey
	I5uczQOe/+/b+yOE2assXD5TgjudCvUwaWyQw2K8UfmUKSZ8I0tef1n3MptG8NvM
	SGWfmxSb/XHZlmFBbCDvL0MuJ6VSn2/Ha44BA/GTzg+QQyuECTFpJIY7rw7OEZ/u
	ARr7r8AazjNPBbsuFf9qrEKnedYytVZD5j6G6rrZsK3H0pepXhIVfIenMIKUBbc+
	u8Gkuo0HrUi3Jug+rW4XTHtskFg5VZ+rzfMMwCX532AHjGvhaLXo0UcTHLkgxHY1
	HXK80DRP4WTsCs16W5ciPoz57tNZgw4yOvy1z1EDMSYIwig0G50T3Rh2FcJ0gESG
	bjilxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj506cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 11:46:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd90958f24so379399385a.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834410; x=1774439210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/Uji+RduemsIjiUG7+YyFltf/mmFoucUv3L55v9doI=;
        b=OvpYsoE5u9cq3nz2+i0LRJrnPq9NYahly34YpQtK7MkVVO8CzZviwvZd5LEcjufLoy
         ixbx6vkNhHwTgD0JtLnj7MhjUAB3k+NnsXgnLIGAHgP7ArPeP/wUfuX9HzQbb3VqZJj6
         XJm2+Uv3QV/0m7HsWLFow/hFqaXTyGoNCiagB7BelbNjGKCJ8+dJgrHHacnvhSHUMvzh
         0t6yScHAWKV48nxooDgVxyMNBdrMbL3PiG5ogNygM2qY2oV8WUZKmm89kKw4Z/NA+Wxv
         pM6v/V6pQP1a6C9FfowAFrRti3mcL2C1Eo9HjSrW+JFgp66HCg8tt4EzOSvoEU0Sg3HV
         3RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834410; x=1774439210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/Uji+RduemsIjiUG7+YyFltf/mmFoucUv3L55v9doI=;
        b=BBnhF/ylYOZxIjGxyKytEYKXJBk1p5FH9Vn+OW3MhihkyaMJT9+oYX/zqiiso2hnKr
         v1rzjw89PgdASf1Gw5FASsZf1RddxxC+3S3b4EAwia3IiG4eFKyAujt6rYE3dKDLxzIx
         mOsSSe82tD0XNnbuKIXyPb5nJZ3NN1aEM1wX6alhjJXwAialLQMTo7LSvVkN7f2K/b0n
         3e1r0RiPFv5viO35B1hjNIf2wqwqRudjosHYql38/30PzpxTMcd+g2DD2B43pl2DFlJW
         NO1QL81t8fFm3LexWdjau7hgwBnZXRJgRn7dEZcXuahg2zxRJf9VI0E92rhMPwAu4Ogw
         dqkg==
X-Forwarded-Encrypted: i=1; AJvYcCVjShRpQQx4NistDUCgqi2Hvh+7uakWw1cVRmWaIhTOj6jG9GZh+J0mTjPR4BmrQfKjFnXk6pEQl5jRcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEgfwg7mTnl8tQefVJneDjY7hk7oSpHbnevjWtAf6odMI0mefz
	qLt4pmAz4CzzfrJekqt0GsLJx8aPFXt8o4MAuP7RJ+J4g8njEIS+Sij81G2lZPH42IlsKU0hH2L
	xdbYvmEduKRq3Z2RpHgucS/blRy4IMspWvX6+5MVnVg47Xv7Fbyw8nnxMdJ0vJ4Ckbw==
X-Gm-Gg: ATEYQzwXHHpZSBGw6V+4GIjHDdljh2q5ry6hAfDjdNpxcuZZkswom/UQ6QftQrpeeN2
	dMqrj2KnHcNKabhkA8lLnP/nfTCwwMJzhsTE3xj8tk4bcFpzVbJ3jKrmK16AxhNRSuvm2TDh9Zg
	1kZ69wygLtUnaoBqA4xT3GG3fownfeiZkCksds9BQZcTxKhEeUj9ebmn7AH0onihTAg5HFltRQw
	C8XjFV0vTzlx6Aa9RlT9tAGVskizail6uLMfX76vdFYHsaUwK+cbG6fGSSOHZD+WlCeeidLC7qb
	RgL2JHm0PtWLqP97PDP4sLQj0eNqTJ6my+0PstCGDK3hCVQqAdWB393XMPiIcegg+oLJKOngs+k
	0fE30GOhfSSfjOalVLoo5XzjQePDKfB+WhHApv/4z0K6aDkIoeTk6KuIzvW+llYtdoIGwnaEssG
	eXPGA=
X-Received: by 2002:ac8:5995:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b14752d52mr27010851cf.2.1773834410572;
        Wed, 18 Mar 2026 04:46:50 -0700 (PDT)
X-Received: by 2002:ac8:5995:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b14752d52mr27010481cf.2.1773834409981;
        Wed, 18 Mar 2026 04:46:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb986esm1503874a12.17.2026.03.18.04.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:46:49 -0700 (PDT)
Message-ID: <33290f42-39a7-48f3-8081-cc15bff2d370@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:46:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX0uvgjMxLrLcC
 g9RSh3cPufI7FMBP/d+w252ObEH9aFGcfOxJv8IxW+TaSEtsj5Fuvthw7a9g4krxalz30L+xgXt
 yQ31SFfqf6HPvjeaMMpJYxhp1zH5X/aTQ5SZ1mGpnMqTaYzTDTG++fdpKd+BNlhgBIv/t97uRLH
 gKnWHIH7wGxquDSKeQWHzahVS3O6qfDrw4CUXgNvLgAosm+I1ANXvZkeWWnXxN25PE+6HbIdL27
 S8NCctW49QPw+/9jqGg60e7N2xmY9Gq+XWOhOEpBaUETBQrIf1L9S+zimqS2fV165WyPDS8EnuT
 SKR1UGi+eURuTJSAfzhDh7YZhWq4X/f0g6s3cCSDnMjj3KaIeCMHnJUYRZxPAjEmgNqFuH0HD15
 cxOVzAb7sFOsUHakSzlwF25A0KgOhuBJSKYtT6v5g7WBaJMLrE5hd04fG9ItzM5Dhvyfq8lUBz3
 7yhNbQmwmc2cvcW0x+A==
X-Proofpoint-ORIG-GUID: fIeeEUWg9T6ImEehmDSLioOB0q1MnEpO
X-Proofpoint-GUID: fIeeEUWg9T6ImEehmDSLioOB0q1MnEpO
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba90ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099

On 3/17/26 11:12 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 01b570d0880d6..b928100f6464b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -39,6 +39,22 @@ aliases {
>  		serial1 = &uart6;
>  	};
>  
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer-0 {

Also if the label is unused, let's drop it

Konrad
