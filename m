Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0833C1A0
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973086; cv=none; b=rvIAO+vM9gmbZeqb21dRCyP1688XNdVMJoQhTsEPCM41+o47VTsFZ9akjHOWoHaEwMIJZyX732kNb1CBE04lb4D1ktFyc3u1/cHxJSMX2KcqoNpyXsV9FnvLu4QhFM+HIgLWKEhHIhzQABSm4qHHf0wObI0X7YBRzha741x7fck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973086; c=relaxed/simple;
	bh=uBF7jlSoEoiH4BfDXFU84wpBnHQgusEmkCAEF3OwAzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBIQRcYvBZqn9PIiovsD5Jrwhqgct26fMFLr3+bqCJcf9OoqvpYp4XaG42qwP1sON9lzKmGFUrtmOp8sWBw+CaRwZca0Acb7wH1+Csbdi9gbSV+vLwKyP9w6vpO0xVYQ8NX6D59jLU/OXwci9woGK0bQi9//lzwhG/Gt/rgW9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4mNHrEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6gi6y2V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4mNHrEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6gi6y2V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAU8JO1215349
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLrWVMaiJs3Mq/N5mWp0CleIsSEtJfnYE58vQXmfhy8=; b=Q4mNHrEmtezQFijs
	y7z2XkHIYSaAzf1cfqSMeRE0ZIiT0Ee0njPCxLidqUdok/3VALUw4Ftcj04pL51Q
	ARJ4/O9pGnUwxgxsIXVDmI/Mr7E8JCKJ3azfGmLlxpVYVkwzUzwMCUFfcKd4VhDx
	gYlBHpoo+saSjTaq3uVy698sZoHws2WYJHoP6ZvQTjiBobnTHCJUwbqB3sGUh5HN
	gGmEs3sWexciqv6seAZmm6lzcvZXK2o13NBy1PyJLudnGb09jOSvXDQIO1Om++xj
	I/cu2KdENSzliJxBGF3OwLVsCgWRmRzMSu8f9hRQ3jxWe5H+Rn/IMVRIR4z/6CRg
	NdG24g==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g359b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:04:43 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64565434d7fso1004924d50.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 04:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973082; x=1766577882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLrWVMaiJs3Mq/N5mWp0CleIsSEtJfnYE58vQXmfhy8=;
        b=Z6gi6y2VGF9mzZkl0/MqJA8BKnhiDIBpW/jZ3K3rI+0i3VYPF1YCz+HnD7q6HJ8VDX
         buml/eUfJY5XjnOpXSQP4ZgJ6eq9D+VcXs/5ZwpiLSE+m4usnpUdWHV7Ec59RWn9bwtN
         jDBQOqqu0LmkB0cMHZIY85JzdxFbXZZEbsHx5RedxF7FDrgoH02djaAaRnB81eESO8IQ
         B3WYaHfgCgxg+Yrad7K3rR419LwnyJrbjGZThizV4b5xgNN8BbhaJHT9cSx32pccGSOP
         0GYKj/zsMSvXorvCnGGIdJdayUeQ7SxjtoPFUatF5dUKdUlmGNFlqnTEzUsjseSiSMEy
         NO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973082; x=1766577882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLrWVMaiJs3Mq/N5mWp0CleIsSEtJfnYE58vQXmfhy8=;
        b=PH1AcX5cGQXxfnvt83/2adb8O9uF4ZrAfWGl8LDYb0X19EtnReQ50an62couXrXsRB
         iBwS2SPaYFYlObC3PaNlLZdJgMqESCv0o1qSpli+ncz2vqER5381h2TDZ28TnCg3ZU1l
         ff7w9v1X7HpNSUFZgBJh4p4S9UddX6C+wxhX2f3ZsTdIdspRZ90ofhl339rcnIoYekKx
         971JL1KLlU9uPxXx335Zn7DZX6S7BUGXB9y2mvcXoVxm5FzhcLS7QEvBqQELM/SdR0PG
         z9waPj+fqYq18lrAZT9jiHKLE3QyRNMXM2d27bNIQpddG/Xb0kE9BoJd1DJ8yBca1WzG
         E00w==
X-Forwarded-Encrypted: i=1; AJvYcCV7YR3EkH4z9vaF/U8WiUuLJxyZHhSNg1Qi6hFr/buDTqgo7mui/NRM4kHDwGH7bTlzeQTaeI7Ww3oDgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjQJ+VflWcU+SOoHtsA/oofxkJ1ZitDxZhRmvkRg4yQUI/agrB
	/lXTEa7NIbUTWDt3OUizZOJL3DuYJWXQYqb5KTth6s3Fma0uiFTNAjj+/6RPQpvre5DBH8/ypZN
	vErSGqu1Tcq5BXbEihQ46AIJ+tdX6On1RXYxp1sGfOtQr8StO+lJnrDpwk4MK3Hxk/g==
X-Gm-Gg: AY/fxX4YJU1/9vBMod6WEfEhEzXK22XP8qjEa1nW83r82lyhi46R+XAxaYPd46UpOcd
	7gJXEAyzw0m71waUn5vNk7+f4C1AIKS1+Ds2WTFy72HdN/EZZ0UFo5L7Ody3PeuMP2KJnsFPAmq
	folVjgF5m3TAIe8C/2mBGueXEhvVT8PprE5huIH5Qf4Hu+YRw9+BpGzmVa4nPpcEcm40Oey8Y/+
	p4Ovg8+L/5XlyidhTa8YAEA02W93sGuq1z/UcVWrVhautE+HtK1wW7wNQw/hqZF51tVXSYSuGf8
	zbVz+lsLrVpD8xMa5eBT8Ae+NO9U3pf8UP2HED93FeQfWMA7xbepX1JpymkYCmg3zGM59lzLdw9
	wpk2TZWrVHYtWyy8rGveKYrANr4yoPAllMTnfCePktdo1CPS/Lmm0NfI2U7ghCHSjuA==
X-Received: by 2002:a05:690c:6601:b0:78c:4388:8afe with SMTP id 00721157ae682-78e66ef695bmr131567317b3.9.1765973082523;
        Wed, 17 Dec 2025 04:04:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4K0A12YGSZ5RpSg8HEc69xOuJj1UoqCdsM3mEK2bJtsg+facTn//Dvo+Pmf4AwKSSNN8OSQ==
X-Received: by 2002:a05:690c:6601:b0:78c:4388:8afe with SMTP id 00721157ae682-78e66ef695bmr131567117b3.9.1765973082091;
        Wed, 17 Dec 2025 04:04:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5cf210sm1969669066b.60.2025.12.17.04.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:04:41 -0800 (PST)
Message-ID: <f3ad33e4-1924-4a8e-8fe0-56487ea2c872@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:04:38 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and
 add placeholders
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ysS9VQb_4YbzaCNgZFKwUBSDOxZb_Tcb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MyBTYWx0ZWRfXyHiraEGPJqJ5
 1ozZIsI+uL/nSmpiCsd3qzgR197ddp1s2XsWwitE8rNK55Jg8y4o8rQzs+RE9PgkZCw8xRJRria
 yYVr6HRKtCF9KrWncSjvWYD8Vl5E3t7Ymgd/EJrcothVxRFtcIpClsh+NfDUAci35fddX20e0nn
 ZSkcLg9jQHwFT5DxGg0JHLEVcqEcV5bUX7frxx/7906VpjGsaBV2tF8Z5X3hmUKGmAVKdc2zZ/T
 yyiywHyPPIRZJpymEJKhyiUpxi0Z3+i6EoAihwh3tOs+W7X2vpMheDBVdvN8Ug9BCXfObHPWfVa
 HqPQ2feAIlCc7+vJe2PiPsjiBPNqdxz4+ZWyUX8w8KHXSnPzeWh1fa8bYocPaEf522hxpeElWEE
 mnpE5xPbkYhrW1OV5jpVC56NvV3Gmw==
X-Proofpoint-GUID: ysS9VQb_4YbzaCNgZFKwUBSDOxZb_Tcb
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=69429c5b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-borPC1GNyWcu_w0NBkA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170093

On 12/16/25 9:34 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know these devices are present; most of them are supported by
> downstream and are close to the mainline kernels.
> 
> This adds placeholders for:
>  - front camera (imx371)
>  - rear cameras (imx519, imx376k)
>  - actuators
>  - NFC node on i2c3
> 
> This is very handy when rebasing the integration tree with
> support for multiple different blocks at the same time.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* nxp,nxp-nci-i2c @28 */

This seems fairly straightforward to enable - could you just
do that instead?

Konrad
