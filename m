Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B4198E91
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941262; cv=none; b=b+MKt0GcJd8MlTgSMZ2bn4zQG9fh2I5SnPpQ/YMmDMNjW0AxSl5KBlKIPKnmRG9JqK7acVbgOM+W0q3KwjrxkIyPym3HhTaRJCK0fEzgxxGVN3Qv9muUg293ee3fCpC9+ZvOSyn3+OZhgvKKsjhnC94BF2lWtKhOwkv2SZ6gqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941262; c=relaxed/simple;
	bh=jVThZqtcyTXWu1N/qKfczl99tuecBZusvkeG3oOjl1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qejziRdj8aDyNaXRqWZFr7xARdUO5Mkz56lpWyJ9o4a4eJY/8T+KLILtQzEkJZoZe8ErTbHBrOjqk9xLMB3WsLj2JEyaYgbgzaELEsfOE1ofY1qz3wV/8IhdkqFWOoYdOW5Gvkd3Z36oD8aVtj2dnbfaRag6X3JknN1ilcQafxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx13eF+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXMZjkN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx13eF+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXMZjkN5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AORp73572185
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 13:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCQDwAEGjTsUJbQElMMhlWhifDFPm1MUSTsyf5S3D8Y=; b=Vx13eF+Cciy0i13X
	OgxTjqqHG3sDxlpUizXl1yvksjZvVWo9Ii+tTAQvk/6+qjxMizZeY8AcM8H3VeLE
	sZ6c5U79WkSiTVel1tnV1kKGXazPvbQCh/XYIez9nVnsDbZsWZJhipkfz/E77w9q
	jHe6NOXprxiny/ZzmYxeZbF8eWBf8/C7Y/F5hLHXKIGa3wZiCgedlBmxtfwKjyrF
	mPPJtNVsNo6ba1Zgz4xRgwbPTy1D0LbfDnORsMUDLCqgm+9vt+mFEWuKV7GShdYb
	xZ3JidG/pqmRDhFr7I6DSHpUqrUIt6RWtQaPCF4b5wbE1GfIrRZhaJMxemvgNYNo
	LkYsPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm58es2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 13:27:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8adc67e5340so17228885a.2
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 05:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764941256; x=1765546056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCQDwAEGjTsUJbQElMMhlWhifDFPm1MUSTsyf5S3D8Y=;
        b=EXMZjkN5iZquYdsoRlvRo0kAMx7D0Pj9I47FOV7kv+aQJhpT0aRxkLZvzmNiw1+ZI5
         eXYKCkK2dKmsu9I7aqWjWp/wnbHPyW2Azd0Hd2Pa/uf1aPA/O2YZrVQ4U/vlZHIzStL6
         /WksOOPfnDRXx8CtdRySlu8thKTSd/che4DeQBz0wx2enm9GAEHpy/Y4sVGBHNEKQeGB
         92AItEB/6GJfhJks03CFVs3FV/QH+OugN4S2It8CWFEiZdRrkARRJX+w6/OlyeIinOjF
         qOpgFgFLtmwpi7nMi0+pyCmLqIvLmC4U8kyL+mrAZawwano+Tyhxt0gv/BJ1hPL9mhT+
         k6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941256; x=1765546056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCQDwAEGjTsUJbQElMMhlWhifDFPm1MUSTsyf5S3D8Y=;
        b=T8mx4Z1e3+uXtqcBfYuzBM6SAb4MsTSouIaAwEnSvq/M0pvrqLLAuzKX8f5uSm5232
         6kewyAiW7RzA+4I8NmIzsBqsmiH+iZiOUI/QU4qzKoqbWl6MKcin9H8dFCBkFT/QRoWA
         c4B9DPsWEf0O5DR8fwwrnrlthvkdiZaknrreOfJ1fDDW8kPjI5R+O3w7gacUlYP8JTyA
         IHQ5pmzmfl8n1zU1f8K07sA8mVsqO9Z7E+cAvM/xaLGe6D5Aib8sRwsr71QVGbVlB6Vd
         JG6EbC3O+y7XHT6l4E64P+fCCC1Qzj15hqN4R9wzh+o7lRqhu5YINRFyOjvQRjN2FprU
         yW5w==
X-Forwarded-Encrypted: i=1; AJvYcCVpgWo/WoZB9jzOCFK3sskslagX0NysvusNfLzdmuBGSfkf37EObsDL99xnai7asiW5jCGsP9MCDFF9Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywE9IGIwt+T+YIB10cGRtfgk/ptFC+kY9FYOMjX0b10u1B3WdR
	qwimXiHtbUcz5cZlIppn7dZzdd878B28ZsIvFw+cu0d3Gq6pGJgLNsJBpDWVGUF4BvZXWfaquNc
	y2dOYRjFlrdGh4yHowqyiKnp/Uu4JhoVHX8WtjmWO3eA8wV2if6qO8kKbOIxxm7JZIQ==
X-Gm-Gg: ASbGncsxokilStSbHGtgZGSTkKWhbQhvOpoAXqeSSyzhpjd6VHU8oqjO34iiwgi9Er5
	JPOIuY/ukQGFnJNkxJj6RtbPMhNxbQCjuHRsCmO8ragvVpbWRl+1MFnmTO/OS4kVwZGNnmtdt8f
	GkeV+kAqYr0zw6v4IobN3RnD/O3nQDy3+jXtVw/zruTPWc4xCYigEY8vwE3Tsz9u1piyiX4D7M/
	+JEcS2p6zb15CHfBgnWiPCPAf5YfABx2NOm43DEhIN4cv45riTd75xn/ZxTI0aywBHdNpptwY7X
	IEC5rnF8dz6XwO1xNT965aMzORNfX5Hq8xAtsPBOLC3wV5a1xTD0mSsu6pIc79aiT06YRg6wldR
	m9jz2Fy4o0reMCB8HjdF4EDy6oOavrW0D0QNnpr7PheaCkaMK8HoDhXxpzcQkZE30sQ==
X-Received: by 2002:a05:620a:3708:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8b5f8c0e8fbmr954701085a.4.1764941256065;
        Fri, 05 Dec 2025 05:27:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI9mo5BIwftqdjJVfsHeIFBWOngs5z5y9sX8W9ISgUAEJ2cJJxx/cWbPUZJjc8uaGbKmV5wg==
X-Received: by 2002:a05:620a:3708:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8b5f8c0e8fbmr954698085a.4.1764941255522;
        Fri, 05 Dec 2025 05:27:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b41219b6sm3839981a12.25.2025.12.05.05.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:27:34 -0800 (PST)
Message-ID: <2bd146fc-06a7-4f62-b542-fe24cb9150fe@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:27:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
To: longnoserob@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        david@ixit.cz
References: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
 <20251205-slpi-v2-1-dfe0b106cf1a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251205-slpi-v2-1-dfe0b106cf1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MKGujnbLlwCVE6SUknWMae2k5dGHa88h
X-Proofpoint-ORIG-GUID: MKGujnbLlwCVE6SUknWMae2k5dGHa88h
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=6932ddc9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=RWXG68yAir6K0NoWbU4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NiBTYWx0ZWRfX0jb1qc01E73x
 mBHp7tZwTq22n48oa3TPj32w0caoWuATuwScwLzknp/uJA0oqW5KQXbYKhIQHDmFVCH95v1wfmy
 Y+7PqaslX62KFAzpXReMtLTEOWRSaGfosUVG2fT328DkIzfZXAhrD6kkf5aXGlumPuy6iCenR6I
 LfTEwk5h2iWrLjTntY4StjE33cYBGu05CW4tM68KbMqly07zGxIJDjSv28qJQLdEnm6g3DEfxVh
 FqfDf996C9jtFEETpUAhZ2sWspfB/rkL6ANGHpJx9UQlZzlmnQkbBHQP9pBbZG+7zpVQRjDTNLe
 6FtKe1n8cl28h+TpEkGJhl1zMXJgD87h+nzTfxyBG/rqgyo2evf/PYYg4EDCJEG+kv/jFwCQbqz
 iQDvEMBGA1dtaJ4DUOSaoT1MPtnagg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050096

On 12/5/25 2:00 PM, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 785006a15e97..cadddcf63ef6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -425,6 +425,12 @@ &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/Xiaomi/beryllium/slpi.mbn";
> +
> +	status = "okay";
> +};
> +
>  &sound {
>  	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
>  	pinctrl-0 = <&quat_mi2s_active
> @@ -637,3 +643,4 @@ &wifi {
>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>  };
> +
> 

Stray hunk?

Konrad
