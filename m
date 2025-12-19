Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA942FD7B3
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141377; cv=none; b=lPhPgC0Zvo1Sn/kXiAEsbvGerNX7Zn+VQWVgXZeCHOnMaPgQZ3RY0J8pNK9ee2OfH/N3/zuZpzVpqRcKXSqd5GtfsyqE9rKPg2JELkSfCRW53EymW5ZokOmH4drsoW+matrocNxiTSOzNAt16S54pkT4CW81FEJuSLBjckL7KnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141377; c=relaxed/simple;
	bh=x+6xRYk2Op/6++Z1R5ZwUV0nU/AQUyfZG/1FG4LXnto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHa7KvuR7eF8yrJp5IYH3fb83f/GEnQ525eQF/Vt2tTUATymYaKcoi/yRyDArcjTCQiPu9Wsz+P8vy2NC6CdTcuDHXN6tgMY2fJv/nYmUL66DHsXarVWbTLVE53CZt7UZF0kbOuYhaNAKPYuS7AvlfEK0RGWixIKWjXFXek17Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLBNPlAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH5xhVkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLBNPlAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH5xhVkT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cCaP091853
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 10:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VIZ8jughWqh2XZFb1D2e0pMbJxJANlZrbN6DOS5EpsU=; b=mLBNPlAKG3xJMruu
	8995kfM27Oz7GGwUZfyHYAlthfNV3COUpKUwMiYch0cIV1dvN3sxGOt0L6J0Gpfr
	TIMDdclShvMeEZ/va6Mx5Q8yT9RL3RjQoK6SGQ4xFbqoq1Z5aWvLew0cXb8+m80R
	nGqGskNMFQe9WPhFTQb9WoU3fuIuK5RxqKsDCAhQG5k3tQTw0NWZblDxgUGy633q
	qLlRWnAWI/DI9BaJFYzjBD0lRCPS9hs81ftdzkcb39VQmAItM15W7UZf4lAfg8cy
	2V+vn4Hb9AzuBQ3R+hh+0qYcWawBoKBflfntmEqxrbbrjoTa703OHQp26f2RMCCs
	MC7L3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eac7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 10:49:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so3928711cf.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 02:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766141374; x=1766746174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VIZ8jughWqh2XZFb1D2e0pMbJxJANlZrbN6DOS5EpsU=;
        b=XH5xhVkTMYak1uzFm/EDjKkMxHvKk6Z7rT6D9mYiTUZwlIPsftPSTIc1/efS1c6T7N
         sNyMoBAIeY7z552j50jMH8BtmgpGuC2P6BZonx2ttY36bq67kRLNURsjjU1H0c31Y2IY
         f62dVdKvpbjZoVAshbtHsSMh4ayPQyVW8RBWFXoQq+gZp2M0GZVeiQVJbRlIAqKmPn6V
         5dLIzSlnIQFw+BKn+Yq5O0pKG3lEe7HMU3+pVWimwh7Vu5Y3Db5jc0H8/JeTrmhx+Nkh
         abrP7DIrIDnfV5Gf9ZCv0clVdE21lX9BvUESHqqDEe9uxFeDwybEMc6TAAHS8LM/fcAC
         5OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766141374; x=1766746174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIZ8jughWqh2XZFb1D2e0pMbJxJANlZrbN6DOS5EpsU=;
        b=qt8xrtn/yTmsfSTOfGHTtJ8xqidbOAU1HvS3bXubp2FIzbSkefkePmdN09EpidsxVz
         iyU5xAo5ftYtyFi/rtmFOPZEAoo9B9k9JfuSGAnSDtiP0jB3cENXxlZ0J2dQy0nx5mly
         luGjjb0r6X0ug4CazzYT/uwH+fcWGi31P05guO5SJCh8qtK40zUEppIGa78aCjRMkmR+
         AQubMe/W5oUJvN3nPeTWRmaWupM4uG7o+UE4BCtc4bfieG3IEavMvHee6zabb+xQZJRm
         A3p+ol5ubh65WuRe7URPnEbdC0waPoMJ2rOBlHu2jcieD1HArIfh5kZJdzmbU2Kf8O5V
         wiVw==
X-Forwarded-Encrypted: i=1; AJvYcCUmOU4jVZ4WwEGupQG5gOg3+Lupna1HRs/+qRkZqY7K5HMrrQ4jiRFoMi+MpHchh+ybp5Erh/S1cEXTBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNYu7mD98rKbhR6BPZ+L7KgoZqwAZd9CmdBYI9Jvz/xiuXc1t
	c9jI7/rSM9n85tJMQUsUzdO8IUyJWAwPVCiRI5mxV4z6roDioawMf9gX+tFDHYK9TBwEaK58GpX
	J51sXT45gK2mEPABZW0ybe5HNxwfxnnp7hrsls5XGtBAuIyQk9qO0lpTsNilD5i/o5g==
X-Gm-Gg: AY/fxX56TfEgvXcuWN2wucnZf1dG8WJ6EG1Zyy3M2XI8tUIJcVIMxU5n1uO7ElcGW+U
	u8mq/yMLrrQpBr8B4oUkVjourVP4YVnCHdv+4CDfSov3PpQn/oRWEImqTzKFKfCgzDRGSM5cM1B
	n+izNbbee36Li/lfvbLGno5YLSZdCfCqtCUUEhA0cnjGGldXwz00vxUv8bKfZkMjvwrRScg7ko3
	E2kYZaJrLjI8qZBYOQ5+Qmtpnc5w47G7rKdf113ESz6N9gz3Pyh6Dx9ieyQMXtMLG6I6z09jRbv
	nZobbxkYjRpwbdD6qFicBmSq1JvfX8srJt6R3U+d5HtJPbcya4owu/1Dj84FljGJJ0LfGoLJ+GL
	UbUj3PAPVi1+M6Br09nbspqdoWQh2KCw9uVfgbswN75xlbGjpwzS+IKTCdqp8Q0inWQ==
X-Received: by 2002:a05:622a:249:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f4abd3d611mr26268471cf.5.1766141373670;
        Fri, 19 Dec 2025 02:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+sBoG00UDaquXtdH6OeQuyKlRB28buLCPRAdJtRH7LIm0VSc1uk9ZDHxp5K9RnmC++71xLw==
X-Received: by 2002:a05:622a:249:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f4abd3d611mr26268201cf.5.1766141373158;
        Fri, 19 Dec 2025 02:49:33 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm1896474a12.12.2025.12.19.02.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:49:32 -0800 (PST)
Message-ID: <d349f8cb-13cd-4bd5-83e3-0d7643c408d1@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:49:30 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and
 add placeholders
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
 <f3ad33e4-1924-4a8e-8fe0-56487ea2c872@oss.qualcomm.com>
 <5199fe6a-550a-4366-bee2-d4ab08ed248b@ixit.cz>
 <5f1282b2-2447-4ce8-a943-90c88e7f5835@oss.qualcomm.com>
 <eafdfb36-8c9d-4240-b476-f5e835df04b6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eafdfb36-8c9d-4240-b476-f5e835df04b6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4OSBTYWx0ZWRfX++8zzstPMrE1
 0H91fybNRbT7n+7tuAquMrsTfvmWMy5I/waPAGCXpEYFcK16wo0LL6AftCbdRE8MBC2P1M2oc6F
 T98jLhJYxlWWMJpoPEeOj+aI/N3fouve7gVOycTZpYhsnDBNOQ4OWQO/DTuMNP2k854KNPAECaU
 661W5lykWoUeFCAv58yeyYDt/vQPYoeReNk3VAjXnpLUlihl+sTzeFiOFTQn0n+3IBO46fkNj/8
 bhhlvdyjFGY1X5eWbxuuvb/x0g+VLQscZ3sxSBb0W1uyROI4/M2Bj1z6jAGel0DVPWPYNZfHhj/
 YrF0qodN8lRnbhBqowwLBxs70qWmzHYVH9scDDWYsTu9VGjtkTSonn19iXyGX8fPaduHG8K/5Vb
 r4reqMi08sKt9tR5r/r6+02z6hL4Mx+4xxy1K5UlcyAqe2kGHKYuurxcQFStvXQXkLhh1tDDhra
 WiVm5+r918IV118V9Xg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69452dbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=KDegXbQYsfhHM6AYP-QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GmhlYb583NIVr4w6QfQI_Ly7vY9IanKl
X-Proofpoint-GUID: GmhlYb583NIVr4w6QfQI_Ly7vY9IanKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190089

On 12/18/25 11:30 PM, David Heidelberg wrote:
> On 17/12/2025 16:28, Konrad Dybcio wrote:
>> On 12/17/25 4:00 PM, David Heidelberg wrote:
>>> On 17/12/2025 13:04, Konrad Dybcio wrote:
>>>> On 12/16/25 9:34 PM, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> We know these devices are present; most of them are supported by
>>>>> downstream and are close to the mainline kernels.
>>>>>
>>>>> This adds placeholders for:
>>>>>    - front camera (imx371)
>>>>>    - rear cameras (imx519, imx376k)
>>>>>    - actuators
>>>>>    - NFC node on i2c3
>>>>>
>>>>> This is very handy when rebasing the integration tree with
>>>>> support for multiple different blocks at the same time.
>>>>>
>>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +&i2c3 {
>>>>> +    clock-frequency = <400000>;
>>>>> +
>>>>> +    status = "okay";
>>>>> +
>>>>> +    /* nxp,nxp-nci-i2c @28 */
>>>>
>>>> This seems fairly straightforward to enable - could you just
>>>> do that instead?
>>>
>>> I have patch for it in-tree, but most likely not correct. See notes in:
>>>
>>> https://gitlab.com/sdm845/sdm845-next/-/commit/eeb765bb1166e020a771ed712fec76b56da229ee
>>>
>>> For now, I can only confirm the device is on the i2c address.
>>
>> Taking a look at just the names of the sdm845-qrd.dtsi/sony modifications for
>> their sdm845 phones in downstream which I presume have the exact same chip anyway:
>>
>> notes based on observation and driver (drivers/nfc/nq-nci.c)
>>
>>          nq@28 {
>>                  compatible = "qcom,nq-nci";
>>                  reg = <0x28>;
>>                  qcom,nq-irq = <&tlmm 63 0x00>; // interrupt, duplicated below
>>                  qcom,nq-ven = <&tlmm 12 0x00>; // voltage enable, ACTIVE_HIGH
>>                  qcom,nq-firm = <&tlmm 62 0x00>; // firmware download, ACTIVE_HIGH
>>                  qcom,nq-clkreq = <&pm8998_gpios 21 0x00>; // clock enable, INPUT
>>                  qcom,nq-esepwr = <&tlmm 116 0x00>; // eSE power enable, ACTIVE_HIGH
>>                  interrupt-parent = <&tlmm>;
>>                  interrupts = <63 0>;
>>         [... blurb ...]
>>          };
>>
>>
>>     pm8998_gpio_21: pm8998_gpio_21 {
>>                  pins = "gpio21";
>>                  function = "normal";
>>                  input-enable;
>>                  bias-pull-down;
>>                  power-source = <1>;
>>          };
>>
>>
>>          /* GPIO_62: NFC_DWLD_EN */
>>          sdm_gpio_62: sdm_gpio_62 {
>>                  mux {
>>                          pins = "gpio62";
>>                          function = "gpio";
>>                  };
>>
>>                  config {
>>                          pins = "gpio62";
>>                          drive-strength = <2>;
>>                          bias-disable;
>>                          output-low;
>>                  };
>>          };
>>
>>
>>          /* GPIO_63: NFC_IRQ */
>>          sdm_gpio_63: sdm_gpio_63 {
>>                  mux {
>>                          pins = "gpio63";
>>                          function = "gpio";
>>                  };
>>
>>                  config {
>>                          pins = "gpio63";
>>                          drive-strength = <2>;
>>                          bias-pull-down;
>>                          input-enable;
>>                  };
>>          };
>>
>>
>>          /* GPIO_12 : NFC_VEN */
>>          sdm_gpio_12: sdm_gpio_12 {
>>                  mux {
>>                          pins = "gpio12";
>>                          function = "gpio";
>>                  };
>>
>>                  config {
>>                          pins = "gpio12";
>>                          drive-strength = <2>;
>>                          bias-disable;
>>                          output-low;
>>                  };
>>          };
>>
>> Konrad
> 
> we have something similar, just different strengths (see below), but I would leave this into the point, when someone can properly verify the configuration and test it.

You *really* need to configure the PMIC GPIO explicitly

Konrad
