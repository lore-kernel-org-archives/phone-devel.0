Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A7C3246EB
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236322; cv=none; b=biWS8TZ/k3QGCCtJ1Dn/xuTk70/hD08JnuutXMNh3KhkSJFCTKOia0QTX/2O89EGIQDXvCyzmfIHdaAbF1SsoJrQJbE4mC9yx2a7N0OAgVadhEJ5f2IJ0nZwXwO9tT0eRouDdP/1U5sfvIMUR6gAX9Qkw/rAIrSZuI3xZflA/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236322; c=relaxed/simple;
	bh=e+oVFlQidjUShB8VLapFDhc604EtMyJ7pK0KAypuqx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfAEHqvL9zL+m+WJsSQCwRUK/t7QKopTXWsI2302d7QDxmKtg0PD8XumzCrAB9Inckm3Y8AXAqi2n+hYYOQpFlYJKkzu0LdTElJGmSM33o2zrNXqnyUhlxjd5PpRBXoFSQeJyr2gMz81/r0oc9AAQRDtU8QYpu6hxUXTA9AjTM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wa9Sx61B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrRL7osn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wa9Sx61B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrRL7osn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBhikR2677054
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TirY6eh2ZP0RoPYvgHG3610zhEOa/tUuPjax27g6Tzw=; b=Wa9Sx61BbmxXnihE
	FRaNpV4V+FOCzZkHFGespdxrvzEOTg0X7Lgcwg1DVfIUUthvlHe9r3mkBXameS1d
	oSrYWAQ7XgA2aDpb46/lSJSIHaiMJbDor+gz8WvK+wTOpg6k2TFwR0tCiiJiPYNS
	IzTFv1FpOXDRt9FGl00hMJwLK9zhRq7KGhDBhx9v+ReP2Dk8rC0ik/HfqsJi11RR
	o6ULhKHyHWfrJBlslhdCmIDU7Rhhm0o1A7xHMuC0BOaZLaYmP+IiVEe1mOLyu4LE
	Hyosj8V0UVuGccZLTXVlBDviS0LMRmzKbxi+1rr13OpKf7hi/Wcx65eh8cKKog4E
	RJ8X7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd1hmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:38:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd90210336so130273985a.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236320; x=1773841120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TirY6eh2ZP0RoPYvgHG3610zhEOa/tUuPjax27g6Tzw=;
        b=KrRL7osnsFuetk4IlkzGNlu8CVg4YKbubSb9e8piuxAbcTNE+L+jghQFye9jGO+2hy
         CcTdoqgSv1ZgnDywNj2xNnH9L9rgI0QqC3JvldtVJkvjOlVa8YgQod2CSKkPSZrob2l8
         jmPmnbr7bXIbhdTFK1cqOQMUlRO00iDh+WjWhQ3wSsuN4pSMLsbt1WibGCvDMQVNgZNt
         B7+85WIW9DXL4TWeSKqwsnGE7AUVXW/0RIcgMHodJ9UaOfS047ULOum5Jj1WkO/9JTck
         pHxHRlsxypFBRc6aK7kv4Q6W4Kyy3Gf9Z0SXBjCIauVi6mxUWY0pgVynHnce23mYsD4S
         guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236320; x=1773841120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TirY6eh2ZP0RoPYvgHG3610zhEOa/tUuPjax27g6Tzw=;
        b=vczhLSrXXaZ23oN7PLTnB/bYvvf9hqJP7eUjLN6L2QZbALI7aKz4hPgpGH4KFqsx8/
         W2F2XOxQ4XbqbKX3HEN49ouV6COzERyQnOQGoN89iEP9o7AxzsvA23xkUtCWDj1oUUgl
         Rf2KzWQhN6VGUCCHqyiCkyid/aKlI3bJiX+ucmWCMS4ts8NW/oTkzhkH3Fm+qjudTLop
         Yog0MRrwNr55/XnLrf5H06O4kv5VjgifzC4u35JN7gsebwSt7HCmLSEIgT8JgAHyzdL/
         8RkSzQK8TBdDuvdGFfVBExBL8r2PVKoykLijBSSQf3+qs6jdnxhcg+v7Or5FLgy7ezIg
         b0rg==
X-Forwarded-Encrypted: i=1; AJvYcCWkHPc1xJ1cUER7HMCM55qgf4orNkPnWPfHagR9znsfSfuNDV6taLuTFNn6lK1In70+dp6hiWzsc2EDMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIejj/8JuPcDLlffRgP2c1+I/FpLvooJ08WL3PnFO/ngnvkEKn
	DFtJHHGH0E4RY0KwxK3T54aqR3ZBdzXoJrapL68Ug2rh/vDUD88HvEAmXz406ktXoXdHKWFY4B1
	UAlhMsyarJ+gJyaHe4xFUg8LdFH0EfUEgHGc0ztCS3xdEORw/UM5doT3TKjD8jGH0rg==
X-Gm-Gg: ATEYQzzDy/ei6959OSaBJJgBnAYlNn0l5qhhKDTitix8DTItETMXoohSo4pO7LLbN6G
	SfC2JJaNg3immVMW4Hg3lxOWeBBFnVRT1AsMcbo98NXYgaLZROwwP6DuBzJ6P5/DcKp123LQH0U
	nJUEbcy/o4u/vOBqnXcdXl9BG0TMy8L2N3DOLd/DTWPBymcUf5n/ZN1JW/eodwcW3VB/O7pTyIV
	3vzryD5v24YBjqMWEAgMqqg0S9uG0uTmMj1rNYrbGhm+AgxJKrIAb15OnXfVXs154Ts0MQ5wPrP
	YeUx8TiOz37ae2IkjVLc13LYe/FI+hCuzVJoihPE3XsILJkBS5dn0DRp5mf679nBuC1X4S8frT3
	R1So7hiJWdbOc3JNz/sdpXBe2Rq7vTwaa3OnVE8NVh4b8FqZnI0gzMRt6bmTw3TfozYKGl9KvlJ
	nrEeg=
X-Received: by 2002:a05:620a:28cc:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cda19cc111mr244083285a.3.1773236319882;
        Wed, 11 Mar 2026 06:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cda19cc111mr244078785a.3.1773236319446;
        Wed, 11 Mar 2026 06:38:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631503c5b2sm560878a12.16.2026.03.11.06.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:38:38 -0700 (PDT)
Message-ID: <62f0af5c-e647-40a6-a174-3cb5d51e4232@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:38:35 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
 <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
 <cddnaabou6vdcdt5pt642wbf3w6e7vwisrnczc3b5wsqtliwql@sqvdkq47tibj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cddnaabou6vdcdt5pt642wbf3w6e7vwisrnczc3b5wsqtliwql@sqvdkq47tibj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNSBTYWx0ZWRfX37AtBOeeWrA+
 g0DdBAE1PiBSy7UNyTP+siMsBX1ckn56ELH794nmIP0QxDob6snKHo4WYrs8YbIyZZ5ISy+zkGV
 tSAVGS2+L7Hzghfxe5tzyey626PjjoCWhEVXSbAf7/n4JWf+F65lN59eXo7n7c2FPVGf1b+JL2N
 30W2LJ4Egs+SVaWXYiCwkCLK2Mgo7Qwt7h77UPnrAe6brIT4zJV289eZhvLIQUjlKsTWA4Io8/9
 Zpo5++cP8ksIyth1c0xJ+IMABJ/IZdxemTJOe0jBln2KiDCMhUk77s9DZEO+aaJIImruaKE1fh9
 nuuuwYmtR2YBqxymv25J3+ZsddDZKKNU8wUSXbTeB8aMBewrVJto7/u3qPjmE3hFwZ3FnXzTNUz
 1ST0S2Na9G93pJFibRMIaT9EyEkScyTMmYORayaNLnJkukCXlIXIjnK0dKY59g8Gb9/IpoPXBLu
 s6N/oAvJntIMiPJVqkg==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b17060 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sfOm8-O8AAAA:8 a=tI4-1GpOe9AOYUiOV_AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 26Axf1siA2KH5ewZE4lIePjDJU2JeFdx
X-Proofpoint-ORIG-GUID: 26Axf1siA2KH5ewZE4lIePjDJU2JeFdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110115

On 3/11/26 2:16 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 01:47:48PM +0100, Konrad Dybcio wrote:
>> On 3/10/26 11:49 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
>>>> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
>>>>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>>>
>>>>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
>>>>> Add it to the device tree.
>>>>>
>>>>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>>> ---
>>>>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>>>>>  1 file changed, 32 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>>>> index 7b2849405462..709ea6fc9fbb 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>>>> @@ -94,6 +94,31 @@ &hsusb_phy {
>>>>>  	status = "okay";
>>>>>  };
>>>>>  
>>>>> +&i2c_3 {
>>>>> +	status = "okay";
>>>>> +
>>>>> +	touchscreen@5d {
>>>>> +		compatible = "goodix,gt5688";
>>>>> +		reg = <0x5d>;
>>>>> +
>>>>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>>>>
>>>> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
>>>> even consume the former. Trying to read through some of that, I think
>>>
>>> I think you need both, take a look, there are enough users of
>>> ts->gpiod_int.
>>
>> I said irq-gpios was necessary, interrupts is not. The only retrieval
>> happens through:
>>
>> if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
>> 	irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
>> 	if (irq > 0 && irq != ts->client->irq) {
>> 		dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
>> 		ts->client->irq = irq;
>> 	}
>> }
> 
> static int goodix_request_irq(struct goodix_ts_data *ts)
> {
>         if (!ts->client->irq)
>                 return 0;
> 
>         return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
>                                          NULL, goodix_ts_irq_handler,
>                                          ts->irq_flags, ts->client->name, ts);
> }
> 
> I thought that i2c_client->irq is handled by the core.

Ohhhh that explains things

Cristian, please ignore my request to remove it then

Konrad
