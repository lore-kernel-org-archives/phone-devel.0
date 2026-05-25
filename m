Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A5340281
	for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705509; cv=none; b=Dtl9p9JsxyKqkiXe4HZZUsfA2rUTn/w8wiqGPFEdZ9o2tekOMYW7u1qJnxIOS66XOawNL15ytydpJ2k6u77eZVlZxVe/sBsFS3E1OrflZ+vzRurLhZX9GfeJ12wau63Vy1MJrR/ap7epfzAfdS0aUFwVbRqXiZNKPQYE9/hcFso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705509; c=relaxed/simple;
	bh=YSz8kgUpzc5nXAU4kAzKN2Q06f9VZ7HLu7NW7kG1/SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etIIKdRhRxqFuEr7VCxZOYlKR7uB3wAZp/e25frMCSZTqmf65h6u0t9iGMY7KQ22cm5ccpaUonNJH4OGeC7MPGP7sg3GjAUdOPi7j7+3JYKCSYl4voXAYD85Ra0aYu4YgU9sqD6AT1sW/4CisU3BSFAQM/8zLyxc69uTHWjK+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsNHIcq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFYoLbAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsNHIcq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFYoLbAA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PA4aeb2145988
	for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=; b=IsNHIcq+AVy807g4
	XXmfIHyW5BPrLDfl3RunYSkoLFhWFVmhUyUjDQMmN7oIU9RlCgo27AgeyyH5uQ7S
	08WfMHu+tyOkeqnugJ7DWyNG7nqsqgDIxtmF9GtIfEogAXCG7XZnV/KJ5Ig+pOWW
	iE+70dCBAAruiUWSyKhB6Sni0SaQNKLa+v5XlJdq/z7XjwyQCV0AUUeY9KMfJPIB
	gLSwp8S7/zVs7nmEUir1OFAKDGqikMwndVRsVzvtCXKCLYjbIH8t7XaawHc3NAex
	gbJdbg/zliCPv7dKXOQvsN9G5WMggLfMWIXN/Pyfhy1v2VRvtS8wcrsh03Fq7ahQ
	w2gM+A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv03p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 10:38:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82751074c8so14161228a12.0
        for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705507; x=1780310307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=VFYoLbAAVOtLMENrV+0Xrqng7UvWw4p7DGHIiRmwu/4NvoNop9uCCYBOJGxzH6+VRs
         LclKQcPTFpfir1ErJw1R1+pyBWmPxkPLPUG7n8Jvg/lwRA+n/5lcFwGKqPURaQYPYbyn
         rCcfWkxXXwE7QXsvvkGtaDxhHOH+r4BpTtypcu1IpVArQu6ZYzJ1TrJReJ9krWwAGCpN
         Kq8AnzmrKwLMSVdmRajDLxvIXivV7EyzmekoeKU4txwnixsoXFPGAmU9WO/VdqBkt/9f
         33lwPHZ6nKoKR3N27zh8ykYhQBmiN0/DftBVQhkG6GVxeq0l0ocZAeonIVzAxp1iqdyp
         wCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705507; x=1780310307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=eJzpLsvU94Csn5mBvrioDdwkLe9mbYtdtOyJkXQzfSlKXl+0wJ1VqkJ/mNd9Q3hTZ+
         9i8NlxKQxORZoy0BU17APUdSR0CBBrE7kvzDcCDWashmnAicwYFgC0DlOire9+Om6/fu
         EALBK5MNp6IcSeK6uALRNr+E4YOoKopD+BKEyZLEeDtU0bgTUOOUlZisQTF+4gz5jjNV
         Lp5Z3Zz2VFuBai3K5io3UZXt9ceuLtpYpi+03JYu6TLP7QydjgbJ0rzNIwl00lxnJTzF
         X7NsQyBS0Rn1xYFuukfAJirByMRwlzb1XxrKa79ChkhZpjKMQvEpvEOCLseVkJ3LVL2s
         L/sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0JQH3bY8WZnr3VLJm1J8SLLVd8YiO6Z+PbmwGUpkwXVHiYJaNZj/sMCGCo3Qc/gQM5LkzQJZ9Xq0qvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3+Eh/EreF0tPSmu1FWeKccwjzqFXHs5HHEvbp0fW6a1+PY0u
	VXHl+YbfpA/AMpU8lawAHhhA7NxR8IQsjweHjerCUcxPlbhIdSSrKZh214ZgqGWiz0aak4I+psy
	siWASdr9h8xngFhzLQ+VJGD3zBU+dDFzeL+y8vMxj/bnEnYFlTCfPCZJZriPgE3Xktg==
X-Gm-Gg: Acq92OE8zTlRSPowBnyhhyBpGg/qNL6B7x4+4Kjm3tyc6LwjZmofsJyJuc07ULEb77p
	II7uMK98hGlIWlR0hR2QdP55yHjJlgMM3hAP+5ny20NGbDSEZg+BW/pl6+2BOZ/M1HPywaPchji
	2g3BMXb38fCROJeNZLjsTozYPBhxBTgw6F6SgBn19d+E8LM3BTuQo8aZ0gGVjbPjb4XdyvcQ+nF
	Eu3fM+gdb0PgNozXTt/+c/I4VvXjVOOQfIA2eQKAhyg4RHRpq4D5f0KC19LZP4Ur2ZMoUG1QtUN
	JxmqCYnDKdMyro1K8UdtNv2FuemkU1LHEW47n2qz1f2mG+ZD7lwrUcAJFeGqeHa1MLlaRximsQ3
	lx/XmthE3rXO6eTugkLLaAyObWu0NcftxGNslgmy6RbudcsJe8uuAJrcGpa8=
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349722637.47.1779705506604;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349682637.47.1779705506118;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164affc22sm9242136b3a.21.2026.05.25.03.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:38:25 -0700 (PDT)
Message-ID: <d4473a79-0629-4a62-bb59-a7b7a917594b@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:08:18 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOCBTYWx0ZWRfX5o4DKed13Wop
 1RrKSpKTVpX99kVVzWJ4MUwsDd8EVMPTfsGJ0mDflydsWL/WVkootKbmLh9qyFV0xE5USdmyhOD
 gJUfmZi+Jsl5jl0uhxP2kHL2h8flhTCgSLvnbEGgK6vxHiZ9dY8sS2cLu0NKtOlJsR5GnQTDlTw
 AZPBvboQb75vbOdzlk6hxwU3yUtEZS4amaPsM4/Lw44gDXFJFCdu9v95474v0+AY2pGu+yx3RTY
 IR+ufDLVXi9SNzZp4GioThyDv7vd+z74G2qyLUTRWu+Bwde9tGwKAzrans7iOM3YoRfv9B3MeT6
 /2wuZa7AvLc9wH8HbNIYGSjmxbLjzfYAnW9z0+yBHk1/jwWoLywWOk/9kY1uw4K1ddW6ZwjAS5+
 SXjfyJbn1zErzfJaAON6ULODo/lxoeQLf6mTPVAQL8fmkZm/IoGf1oHQIS/jlgNearpM17onXO8
 vrHIIqhvfNBqFoxiIvQ==
X-Proofpoint-GUID: oibzuE1ifo7PgY4p6oG_NkMMJ7irymRy
X-Proofpoint-ORIG-GUID: oibzuE1ifo7PgY4p6oG_NkMMJ7irymRy
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a1426a3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=plRfSYbjXIbEfgUgcesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250108



On 5/25/2026 3:26 PM, Erikas Bitovtas wrote:
> 
> 
> On 5/25/26 8:51 AM, Taniya Das wrote:
>>
>>
>> On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>>>       .halt_reg = 0x4c02c,
>>>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>> please use .halt_check = BRANCH_HALT
>>>>
>>> If I do that, the clock fails to power on on boot.
>>> [   20.324488] ------------[ cut here ]------------
>>> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
>>> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
>>
>>
>> I am hoping the Venus driver has enabled the GDSC before requesting the
>> clock enable.
>>
> It does. From 3/9:
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res = core->res;
> +	struct device *pd_dev;
> +	int i = 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		ret = pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			pm_runtime_put_sync(pd_dev);
> +			goto err;
> +		}
> +	}
> 
>  static void core_put_v1(struct venus_core *core)
> @@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core,
> int on)
>  {
>  	int ret = 0;
> 
> -	if (on == POWER_ON)
> +	if (on == POWER_ON) {
> +		ret = vcodec_domains_enable(core);
> +		if (ret)
> +			return ret;
> +
>  		ret = core_clks_enable(core);
> -	else
> +		if (ret)
> +			goto fail_pmdomains;
> +
> +		if (!core->res->vcodec_pmdomains)
> +			return 0;
> +
> +		ret = vcodec_clks_enable(core, core->vcodec_clks);
> +		if (ret)
> +			goto fail_core_clks;
> +


Please check this sequence is taken care or not

Power-up/Boot-up
1. Enable GDSC
2. Enable clocks
3. Request GDSC to HW control via 'dev_pm_genpd_set_hwmode', true

Power-Down
4. Request GDSC to SW control via 'dev_pm_genpd_set_hwmode', false
5. Disable clocks
6. Disable GDSC

-- 
Thanks,
Taniya Das

