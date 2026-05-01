Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A90372686
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 22:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777674754; cv=none; b=O2oJzCfmYTuB6MqTZD3TffNyNdL3oPvaCfR0rFijQasOr0T1NeXPIkLtfYYd9V9u1kegoDky8Xe91QMIAE4/VVJ3bgi2p20YRGWWNifgwM+eDh9PAubHxZnj6Hu7NXPgmraLtTSrYKsmJ3rb5x1xVPN4rf8AHzm8CWhT9WWg7b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777674754; c=relaxed/simple;
	bh=4oi2IaluIhRvKF52S0SOnm9jRb+Tkz0XS5iLBmxeyEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGQxUgg6uBk6KV+T0ND/7M3fpNqWSfukk3MpHc8OLnqT4FQgOOanoherS4/4A3FXZIayrmlAINRJc1v56EfdOZNYfhgeXXgcmxWEhEfKgmzaBb2tAFn/+TH50Ne+ijrh1TupUgkmsra95FJ5piQ8fQeQCfTxuZq/8KEk3a0/64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ebcn3N/X; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ebcn3N/X"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891f625344so24174575e9.0
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777674751; x=1778279551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mE5A7NqhuYtbLG8hB5tWWnVE9s95FeOPuLQxQGxHZPU=;
        b=Ebcn3N/XZLnJqYQjncNMCDkhq0PcA0mfHACoi0uFKei414VDH7AiAEC49j3M5ugjpI
         ug7S5v13aviAvKRT4MQJV6DR21/typZ/NN8LnitDsmsL9WFcwPZ992FwoGAfXzn12151
         TWvYnZ2wTo5Sy0Kp3h1W/p8LDr4joMOJJlmklV32OuXQgXC9O6YB1LXTNnVTzgCttIrr
         +uRtaYb84Yj5g9+cjvRKQqcIa77dNAVQGzLKvPIVLX9nEfNLSEQYhGg9wCRc4OCgPrBU
         EoL9qB1PpbG8JQ/zEtB00wHuC9qehz2puGVI4tNAE1zflmIPxEAP5V5PyAUZJIKRyNlt
         Nn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777674751; x=1778279551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mE5A7NqhuYtbLG8hB5tWWnVE9s95FeOPuLQxQGxHZPU=;
        b=lwQ2hESwz/fWm5+ONYR1teUf7EuodGPeERgtFwe7mdvJTPsyht9V93cdzO8HavcK0j
         9qVsy8My8ef7JZhLtdkrgfkF3nndsGUyY8tSYGrHg2laJNVvj9jr1Quh0notOJ3r9eZS
         9DqUMVWfNJcdJsEkznt+EYHmvFvIyYZhHEoB5DO7nbFtmxKfEetavOgE9NF7tZ7Cxald
         rygkyHG0ga8M8m0Tp5+ts9S3P8re/i3P8v6ApjZhwAzR8RdvaxaHJ2GBRl9uuYeTOwHE
         m+raSg2e+dRQ4Ziqb+UIQYYvpX3qbGeYMFDBdfeDmz+aIcKGsjy0wyReheBZTg6zBec+
         DJGQ==
X-Forwarded-Encrypted: i=1; AFNElJ86iSE1Hyt8ltCJBe3V54IZEgv1eF35SR5912fGjWQpJJtXyE277vm9IqN0unf7gN63kNR97uq9pv7hQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIo0/tYXGsmxszmET5vzCwG7l4SF96XKmu9k5c6DACrwEGGJIb
	d1cKpT/TbtQ3MqD4Ts+ru0Tj/tJPDCade2KCWI5lHpuqVRi55J8x6g/phQCJZCbSqXM=
X-Gm-Gg: AeBDieuO3cRxy1DL5j7eMedhpuOetggKO1f45X0D5x/Zxai8H1pQZmKilk3X9ky/zQg
	9YBk3Sqqn16WdaDfphxLu0f/5zVfBzeF6CopnaCfgki5xOXi7hJckCsCTCzrHA8+qNLfE8CCkqv
	TbTBuGscycCkXBY1zJ3ZmXwr04Sg+PD1S8dBy+RjAIa9dg5/hi6DsUsMQp2jUJvdnvvu8wZivaD
	xuXDG8kuKMigvB1F0itBo4nT1VjmHWFpRXEc8Z1rqnTJ5QujJ9u4pE+wcyhhI97BGRM0AArY6hg
	8VXiywSgRwsULAbyd3B7kAPt7kLDlP3LKDo/CQ+RqcSIb4x12slsh8Kcv2+dkjZUhLjOjDeWYCX
	bLWryVVeT0K+4oftkxsrheTBC3Cj5Hv7dLDNgkuZtQBtpLF2ljD24AN1Qed0DG5u/7kxYIz/1lf
	4hCVddjMCoJZ8N5Ek5Ve7lRSW2QbiFYp6pTmG2fdrc0EYDM08o
X-Received: by 2002:a05:600c:a410:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a970c1bc1mr14014075e9.8.1777674750296;
        Fri, 01 May 2026 15:32:30 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe845f0sm32044245e9.1.2026.05.01.15.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 15:32:29 -0700 (PDT)
Message-ID: <108ecc23-c821-4387-a324-5e3c20c3cc5e@linaro.org>
Date: Fri, 1 May 2026 23:32:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
 <4SLDL62Oin3XdiLjUEC_YAVA-m1dKV4j_8_RolU6NJFWCIWtem6e6sCb9n7OIHbcIWBfWdXx_vZy5mXCAbWUDg==@protonmail.internalid>
 <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com>
 <c87d229c-137c-4e59-99cc-a97ef04f6e1b@kernel.org>
 <DI79CX4PU08J.2M2V0U4PTOVEU@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <DI79CX4PU08J.2M2V0U4PTOVEU@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/05/2026 11:12, Luca Weiss wrote:
> Hi Bryan,
> 
> On Fri Apr 3, 2026 at 5:07 PM CEST, Bryan O'Donoghue wrote:
>> On 03/04/2026 09:09, Luca Weiss wrote:
>>> Hi Vladimir,
>>>
>>> On Tue Mar 31, 2026 at 12:49 AM CEST, Vladimir Zapolskiy wrote:
>>>> Hi Luca,
>>>>
>>>> On 2/16/26 10:54, Luca Weiss wrote:
>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>> SM6350 SoC.
>>>>>
>>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>>> far as I can tell.
>>>>>
>>>>> Though when stopping the camera stream, the following clock warning
>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>>> while the clock is on, and 'off' while it's off.
>>>>>
>>>>> Any suggestion how to fix this, is appreciated.
>>>>
>>>> I've looked at CAMCC recently, and I do notice that SM6350 CAMCC does not
>>>> set '.use_rpm = true' flag for whatever reason.
>>>>
>>>> If you find a free minute, can you test the change below?..
>>>
>>> Unfortunately that change does not resolve the "gcc_camera_axi_clk
>>> status stuck at 'on'" warning.
>>>
>>> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-controller/power/runtime_status
>>> active
>>>
>>> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-controller/power/runtime_status
>>> suspended
>>>
>>>>
>>>> ----8<----
>>>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
>>>> index 7df12c1311c6..ba880e4edcaf 100644
>>>> --- a/drivers/clk/qcom/camcc-sm6350.c
>>>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>>>> @@ -1880,6 +1880,7 @@ static const struct qcom_cc_desc camcc_sm6350_desc = {
>>>>     	.num_clks = ARRAY_SIZE(camcc_sm6350_clocks),
>>>>     	.gdscs = camcc_sm6350_gdscs,
>>>>     	.num_gdscs = ARRAY_SIZE(camcc_sm6350_gdscs),
>>>> +	.use_rpm = true,
>>>>     };
>>>>
>>>>     static const struct of_device_id camcc_sm6350_match_table[] = {
>>>> ----8<----
>>>>
>>>> This change could be considered to be included in any case, I believe.
>>>
>>> I guess this change is now the way to enable pm_runtime, I had this
>>> series 3 years ago in February 2023:
>>> https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com/
>>>
>>> But I never followed up due to me not understanding pm_runtime well and
>>> no direct need for it.
>>>
>>> But I guess reviving that with use_rpm = true, add power-domains &
>>> required-opps to dt-bindings and sm6350.dtsi should be a good idea?
>>>
>>> Regards
>>> Luca
>>>
>>>>
>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>>> [ 5738.591081] Modules linked in:
>>>>> [ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Tainted: G        W           6.17.0-00057-ge6b67db49622 #71 NONE
>>>>> [ 5738.591118] Tainted: [W]=WARN
>>>>> [ 5738.591126] Hardware name: Fairphone 4 (DT)
>>>>> [ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> [ 5738.591150] pc : clk_branch_toggle+0x170/0x190
>>>>> [ 5738.591164] lr : clk_branch_toggle+0x170/0x190
>>>>> [ 5738.591177] sp : ffff800086ed3980
>>>>> [ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff800086ed3cd8
>>>>> [ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 0000000000000000
>>>>> [ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 0000000000000000
>>>>> [ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 00000000000064c8
>>>>> [ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffffda14fd2a07b0
>>>>> [ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
>>>>> [ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffda14fd2a0838
>>>>> [ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffffda14fd2f8838
>>>>> [ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff25ecf9d7e000
>>>>> [ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000baf5c100
>>>>> [ 5738.591403] Call trace:
>>>>> [ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
>>>>> [ 5738.591429]  clk_branch2_disable+0x1c/0x30
>>>>> [ 5738.591445]  clk_core_disable+0x5c/0xb4
>>>>> [ 5738.591462]  clk_disable+0x38/0x60
>>>>> [ 5738.591478]  camss_disable_clocks+0x44/0x78
>>>>> [ 5738.591496]  vfe_put+0x7c/0xc0
>>>>> [ 5738.591512]  vfe_set_power+0x40/0x50
>>>>> [ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
>>>>> [ 5738.591546]  pipeline_pm_power+0x74/0xf4
>>>>> [ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
>>>>> [ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
>>>>> [ 5738.591592]  video_unprepare_streaming+0x18/0x24
>>>>> [ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
>>>>> [ 5738.591626]  vb2_core_streamoff+0x24/0xc8
>>>>> [ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
>>>>> [ 5738.591657]  v4l_streamoff+0x24/0x30
>>>>> [ 5738.591672]  __video_do_ioctl+0x430/0x4a8
>>>>> [ 5738.591689]  video_usercopy+0x2ac/0x680
>>>>> [ 5738.591705]  video_ioctl2+0x18/0x40
>>>>> [ 5738.591720]  v4l2_ioctl+0x40/0x60
>>>>> [ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
>>>>> [ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
>>>>> [ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
>>>>> [ 5738.591785]  do_el0_svc+0x1c/0x28
>>>>> [ 5738.591801]  el0_svc+0x34/0xe8
>>>>> [ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
>>>>> [ 5738.591838]  el0t_64_sync+0x198/0x19c
>>>>> [ 5738.591854] ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>> Changes in v4:
>>>>> - Update power-domain-names order (Krzysztof)
>>>>> - Make hex numbers lower case in init seq (David)
>>>>> - Pick up tags
>>>>> - Link to v3: https://lore.kernel.org/r/20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com
>>>>
>>>> Should find some time myself to issue RBs, sorry for the delay.
>>>>
>>>>> Changes in v3:
>>>>> - Update dt-bindings to include everything related to camss
>>>>> - Update regulator names
>>>>> - Remove slow_ahb_src
>>>>> - Link to v2: https://lore.kernel.org/r/20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com
>>>>>
>>>>> Changes in v2:
>>>>> - Remove prefix from interconnect-names
>>>>> - Move 'top' power-domain to the top of list
>>>>> - Update regulator supply names
>>>>> - Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-63d626638add@fairphone.com
>>>>>
>>>>> ---
>>>>> Luca Weiss (3):
>>>>>          dt-bindings: media: camss: Add qcom,sm6350-camss
>>>>>          media: qcom: camss: Add SM6350 support
>>>>>          arm64: dts: qcom: sm6350: Add CAMSS node
>>>>>
>>>>>     .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
>>>>>     arch/arm64/boot/dts/qcom/sm6350.dtsi               | 233 ++++++++++
>>>>>     .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++
>>>>>     drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>>>>>     drivers/media/platform/qcom/camss/camss.c          | 261 ++++++++++++
>>>>>     drivers/media/platform/qcom/camss/camss.h          |   1 +
>>>>>     6 files changed, 1093 insertions(+)
>>>>> ---
>>>>> base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
>>>>> change-id: 20251024-sm6350-camss-9c404bf9cfdd
>>>>>
>>>>> Best regards,
>>>
>>
>> What about taking the clock out of hardware gated mode ?
>>
>> ┌─[deckard@sagittarius-a] - [~/Development/qualcomm/qlt-kernel] - [Fri
>> Apr 03, 16:05]
>> └─[$]> git diff
>> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
>> index a4d6dff9d0f7f..f98cb35bcd408 100644
>> --- a/drivers/clk/qcom/gcc-sm6350.c
>> +++ b/drivers/clk/qcom/gcc-sm6350.c
>> @@ -909,8 +909,6 @@ static struct clk_branch gcc_camera_ahb_clk = {
>>    static struct clk_branch gcc_camera_axi_clk = {
>>           .halt_reg = 0x17018,
>>           .halt_check = BRANCH_HALT,
>> -       .hwcg_reg = 0x17018,
>> -       .hwcg_bit = 1,
> 
> Unfortunately this change has no effect, still getting the same error
> 
> [  192.154311] ------------[ cut here ]------------
> [  192.154339] gcc_camera_axi_clk status stuck at 'on'
> [  192.154364] WARNING: drivers/clk/qcom/clk-branch.c:87 at clk_branch_toggle+0x170/0x190, CPU#5: CameraManager/5996
> [  192.154387] Modules linked in:
> [  192.154403] CPU: 5 UID: 10000 PID: 5996 Comm: CameraManager Tainted: G        W           7.0.0-00074-gb9262f98394c-dirty #31 PREEMPTLAZY
> 
> Regards
> Luca

Sorry wait a second did you say you had a fix for this around CX ?

https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm-v3-2-d35e0d833cc4@fairphone.com/

Is this series adding or missing power-domains = <CX> ?

Shouldn't this be in the gcc node ?

+			power-domains = <&rpmhpd SM6350_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>;

---
bod
