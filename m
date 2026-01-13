Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB6238B994
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296107; cv=none; b=OVSQYoLAMiwA7p7Za+zQAUS1oxIFZSyA6OMWNoeVyZ+qzespglFZxTAU7b9rANPKUSpv7uzpeWgUHtzrT8CHcYQrOLA60SX78jbhlKQklVVGDg1qNklWKKwhdDGXUZ3sJmX4BQetIBamw02zU8wS5NP+dDXLyEAQcu9J5Kdf0vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296107; c=relaxed/simple;
	bh=IL9GEg3VWIuo4o/aOy+T2nt90+e7EZnrfEvtZfYuLeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3C+SyIBAE4XYeOlGQEhljB07s0JMupTZ81ucFBgg0MPvUQR28I+SccgQKLomUixr5kwa/ohM4+5gXa1kktWNIdmpSBwef/ws7/8/0X/r/YbALzJvxYCGTacsjCPwC4sSNtCCxlvqp5pH5iWUtKpaA6J3EQ8cOULC4COt5q2um4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIkMc2pZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBerEy+Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIkMc2pZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBerEy+Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7wcdj3300067
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IL9GEg3VWIuo4o/aOy+T2nt90+e7EZnrfEvtZfYuLeY=; b=fIkMc2pZi2aLFVhz
	zM97mTrnfYH9GSLqd1wLKELqs/tsc6c/GoxbC9JDN+rWou482nByOAKiP6f/QtxK
	OkG0jX5uJHPNYxcNS9MrPWN0UlAE/Dr5zEEoeUietUdOHRRjfEF7WXTLsItAeZgI
	qH7ujIauF4FAMUXunhdeDRZfB0viZkU+FR6OIWHQ1nEDp9Gv4aBggwGd6h9DEXUw
	47j/DwSA5r3/5Ps/A2D4wUihJO9oPy4luGcicmIC0ma7DMfQR/ROgMy4oHNn7Aqb
	hdBt3C6TcRomQf4LE8XUZGetMIazwbo5SKgx4TS8fBJ4X+Apmv/9wgx1t0c1r7Ts
	SLmoOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma5xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:21:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b5ff26d6a9so153521685a.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296092; x=1768900892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IL9GEg3VWIuo4o/aOy+T2nt90+e7EZnrfEvtZfYuLeY=;
        b=DBerEy+QO703UYIIjvMfhwsYPFKeqLcIM1JL1s0KkfutKUID3+yJ9UVuSwGsdazOwS
         z3PS//RlcdENtebOjiYXt+cKzIgIv5HF5aWwk3beVvaFOKx+e0+V/yz+DuyO/YMvG/+v
         t1KTKBNbpGXukWvSipQ4GTtj+E58/fKiJRAyQrrYFsGXlz5v34jKs4B2C4FBmuQ6oX44
         D29HaLZWjO6pfJTNEUDTyTeskJPOJu9Yb2O807Ksli/X6Cv55IhPl8cIOgXJpO/iID3Q
         zPDdBCFxkkydZ0qWX7ZpSFGIm1WMupd1xA8E9zNe7EZTjCcv4nOH+e4gUHupOhLHT2uu
         Us0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296092; x=1768900892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL9GEg3VWIuo4o/aOy+T2nt90+e7EZnrfEvtZfYuLeY=;
        b=FXDluvMuSrsPk8yuFYvjfUi4THhlEAMczjHHYYljzlfZegi4XPS3I3ALLN7vV5BUvQ
         FbVSIMGaY/oEQKw61vQoOLD+isglNWM7Q6OnxV79ADolWsUwYzxDSLIYXb7eJDL+Da6e
         VmVyXW2n/7kMj+OZVELlEwHavfcs/bSvsqZjND2lclvzpwmG9fIqKP/fnScZQ1U5UKQh
         c2Zgu+Fey1tHbH6PqpHfJ+NzVFuTqVlt7F+jYjpZqGZ5xdMWsFYD5yst46+xtKYcMI83
         2jE8Grr1EyGvcTEZo3HQy4iX9ndh5eQmh6yh0BapIK7AYTuL/soS+tMIXy0tqqt/zm0h
         mpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatbIeeYtHthzcx5i4gFpX8fzZviK838JUhpsh6Vb7DQcMhRHALyBjRX9KbKBnun4nRSlyKvO1J81Nrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj4mFs6eyBMor9i/jVof46wTMGLfnHqFhv0r+SGMYuZcJ8TpfL
	gbKiMNaaID2Nt7H9MouLnS+CZH9zFPldi461Xtdj9HxgrLFACWz2ofzH7yXmLglxhMMxu6OhLnY
	hMSS/vsEpWc7IWEW3k8SPogUk58zpi+ATobrNd3MYMcEzmBhi6KYx9FNQLbflo1aHkg==
X-Gm-Gg: AY/fxX5qXiY9igDDxN5dSmRbU8J0tyx4UmfGpD4wIwIuU+LWCcihoNdXdrPVpA5vO51
	UN923IJGQSQJ2ft1pclr/qQDa93lh88b3cFCD6jbXSG95e1g2ApAWMhuAcy8m45R3pPDV8YFyTz
	+pj/beLw6zE3iMHHEbBERacD0VfMrDYqYPI2BWqrozQaR9kXTuQG2esttJD48Wfy6YBrWQiM6rf
	5QK0n6UJvIvimTz1rcJDkCSqnfh7s9LuZu/bJMxMSobOwW0cHbCa3cZugM5OhBz1WyIbwGqJ9rk
	qdgafEV3DGImR/IH2+ykoI+zyBt4elhGEviUDdGBEgGrnS6VJZ/h7fY4OQ6T6cT+MTgAfEMML9R
	udMjNy114NAFCo0O+jmP5WHgL+WA/KHhO+2N72FbJufEMJEQ5v5AaDWzRl4TFvblJGeM=
X-Received: by 2002:a05:620a:450d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c3893e473amr1945996285a.6.1768296092403;
        Tue, 13 Jan 2026 01:21:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsEcVJwKbgDHZjjh3kzPYbpyoPTpRoSAaXHNkk+gRf29/rnkJzQvTtxnhVExV4xg1iTKSzhQ==
X-Received: by 2002:a05:620a:450d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c3893e473amr1945993485a.6.1768296091863;
        Tue, 13 Jan 2026 01:21:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8717a10ae1sm568069966b.32.2026.01.13.01.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:21:31 -0800 (PST)
Message-ID: <ef529282-68da-4fd9-83f8-6d80206fee75@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:21:28 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <233f73de-b247-4b22-a079-5bd3f5ece5cd@oss.qualcomm.com>
 <dd141d65b3ee1c9e1f3148bccee6e964@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dd141d65b3ee1c9e1f3148bccee6e964@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bQr3UmGwiurKX3HFe_R-mRrFhEnNMGdV
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69660e9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=QM4QLvQof7z9zqEO4a4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: bQr3UmGwiurKX3HFe_R-mRrFhEnNMGdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX5xDdxTb1qwWY
 EF+m/pnXuBFzEnXAYl6lq+Vt9JfuRUsSV+CnYwVRYIdBxtGN8C2XKoT0Tj0hqhmlBkv64AYdUXM
 0EIpyCe9enxJ6ILO/J4gSWIKAzhJ/dMVHFJco9SdZ8GmNqjvsMR4jjec5fyKXEA2M6UVpFB9enp
 ppmL/P58hIN4y/BbU1SOPOjm0bFjC/Bx00LcsEYl9e3XXkFBUFZsc2gq7Wjjqmztzp+dSXLkF+N
 iEVK6nnsZuk7zLC8cB+Z8R7KjFAUTWdQhFpdVjNYqkhKdtPcpMAgWEpTyylOgVL7e6Qs3LR6hSY
 G/rJGZ+UjWAmcAe3CRweNQTOG7e25IHh2yTOLgq8vQDwn9hg4vc5JtOwIapIH7QVjSvdl1JVEli
 anlDN3ALBfSrsV6Azkpzi74kldfYkCuo98QH80eXRa7ibH4RTqzuKMz53U4Yc+7fyL7lksPa+JM
 9lPNwLx5mpArjHJ3/3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

On 1/13/26 10:14 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 09:53, Konrad Dybcio wrote:
>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>> The device was crashing on high memory load because the reserved memory
>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>> Change the ramoops memory range to match with the values from the recovery
>>> to be able to get the results from the device.
>>>
>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 44 ++++++++++++++++-------
>>>  1 file changed, 32 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> index bf03226a6f85..4c548cb5f253 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> @@ -13,6 +13,12 @@
>>>  #include "sm6125.dtsi"
>>>  #include "pm6125.dtsi"
>>>
>>> +/delete-node/ &adsp_pil_mem;
>>> +/delete-node/ &cont_splash_mem;
>>> +/delete-node/ &gpu_mem;
>>> +/delete-node/ &ipa_fw_mem;
>>> +/delete-node/ &ipa_gsi_mem;
>>> +
>>>  / {
>>>      model = "Xiaomi Redmi Note 8";
>>>      compatible = "xiaomi,ginkgo", "qcom,sm6125";
>>> @@ -36,28 +42,42 @@ framebuffer0: framebuffer@5c000000 {
>>>      };
>>>
>>>      reserved-memory {
>>> -        debug_mem: debug@ffb00000 {
>>> -            reg = <0x0 0xffb00000 0x0 0xc0000>;
>>> +        adsp_pil_mem: adsp_pil_mem@55300000 {
>>> +            reg = <0x0 0x55300000 0x0 0x2200000>;
>>>              no-map;
>>>          };
>>>
>>> -        last_log_mem: lastlog@ffbc0000 {
>>> -            reg = <0x0 0xffbc0000 0x0 0x80000>;
>>> +        ipa_fw_mem: ipa_fw_mem@57500000 {
>>> +            reg = <0x0 0x57500000 0x0 0x10000>;
>>>              no-map;
>>>          };
>>>
>>> -        pstore_mem: ramoops@ffc00000 {
>>> -            compatible = "ramoops";
>>> -            reg = <0x0 0xffc40000 0x0 0xc0000>;
>>> -            record-size = <0x1000>;
>>> -            console-size = <0x40000>;
>>> -            pmsg-size = <0x20000>;
>>> +        ipa_gsi_mem: ipa_gsi_mem@57510000 {
>>> +            reg = <0x0 0x57510000 0x0 0x5000>;
>>> +            no-map;
>>>          };
>>>
>>> -        cmdline_mem: memory@ffd00000 {
>>> -            reg = <0x0 0xffd40000 0x0 0x1000>;
>>> +        gpu_mem: gpu_mem@57515000 {
>>> +            reg = <0x0 0x57515000 0x0 0x2000>;
>>>              no-map;
>>>          };
>>> +
>>> +        framebuffer@5c000000 {
>>> +            reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        /*
>>> +         * Matching with recovery values
>>> +         * to be able to get the results.
>>> +         */
>>
>> /* This is an unnecessarily
>>  * squashed comment that could
>>  * easily go into a single line
>>  */
>>
>>
>>> +        ramoops@61600000 {
>>> +            compatible = "ramoops";
>>> +            reg = <0x0 0x61600000 0x0 0x400000>;
>>> +            record-size = <0x80000>;
>>> +            pmsg-size = <0x200000>;
>>> +            console-size = <0x100000>;
>>
>> Does your recovery image not specify ecc-size?
> No.
>>
>> In my past experience, that led to much better results wrt the data
>> being actually readable.. you might want to rebuild your recovery (or
>> at least the dt and repack the boot.img) for that
> I would not because i have got good results with this settings and
> users could use already built recoveries to get the result.

Ok, no worries then

Konrad
