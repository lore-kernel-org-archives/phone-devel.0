Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B992BE639
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315278; cv=none; b=bFlDa5fmZp3LuQbFsr+HSU+JNqYtp4juCIaXAMwkwRKZl0xHDJ7PQHy1cXIxJyAUHjL7RRzz8H2+krVWoDJUhoKdB69Scewr49U+OHzBeR+AsRWcP0sxX/PUTAHgFWStmH36pURgoYSbXBesqp6qceHFMaa8qXIkHl5Iv5oJ0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315278; c=relaxed/simple;
	bh=y2JTVO/J3TdTZAkcTfI9SiMwIDc+v6SkWlt+/vPBE5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhMRhR1xY2Vo3GEosXwtJ4STzZZ0x5KJSUJ/6n4/LjUuZ2H2jO+r6SutruoiAuSTA/+mGEweHThHEdPDw3SEv/zA/D0wlr4FX0DWgUC62eva3OkC4ZOikVvKKNwW12lBMb1NABt5mFEFh9jniWI395TSw8gdcOm10TOBgmX/UQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVP5FOqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHUREo+m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVP5FOqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHUREo+m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7S9Zq1935055
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81eSaaCysi2DaaK9DLEMeeuVHb0KB/kJPfkjhFnrq+k=; b=mVP5FOqJDeipflDd
	uq1rXsF2PIJXd0Jey7aAwN5ILBXxFpADZ2ZtKXkkrc3wHjs0eco+eodqM7+vQEET
	HOciJTFjRUm/yJxkm3v7vEnmh0/hlrcOdIGGMmmmSe7p8Ya2VZ9m0E6KKlwhOSSu
	U/hFHVuClPBfvtGWZFwTgJOg4hmaFBfG9wL5wpzuVe4pi+B1nScZyJjPOvevlYWH
	CWLnlNLMBa6INaeGJ/QHyLh8ZK3491ocwPorK+wG+K9PWx8sVTU4xyCD3wdCqkpQ
	9hHlVRAMnp+pqy5GrnU4ENzt0Lx2VzdjleBdoXDib86+Nsq3EBmOkofUvKXXTVaE
	lUxzZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnk92u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 14:41:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52de12a65so3460285a.2
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315274; x=1768920074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81eSaaCysi2DaaK9DLEMeeuVHb0KB/kJPfkjhFnrq+k=;
        b=XHUREo+mXx+iHZd58PXfkO7rqTerSz6IohmzsuPby5iqqK/YKfWZ5wvuddqWYjI2xv
         taoQEH9+nV8JPBvR4p8uf3NEoMcECivywsffOPRYZsHYbuP7JLEWWQyy6c0W85ant3W6
         u183mGiTSpTHg92/q9Q0y+GC5dRalA4RwHl2x8lcgl0wLdZhmqGJQ6geU7ygxVAs1hKe
         ccJvK8Cxqb27FwXc/ocVo9N2W5ChkHsaN7Davt3/Od9OUnnlPucvAN1iUNorvhO6TVq1
         /qPGf6MQna60kxK2yiudz4zzlAHVdCWTp2Exyt5Em9j12XoEfpadnCttPjJNzZ6bUeBN
         dQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315274; x=1768920074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81eSaaCysi2DaaK9DLEMeeuVHb0KB/kJPfkjhFnrq+k=;
        b=rF3c+RurCBoBppZulhR5YKA/WjKclPjOgTRgF2YCOx7sU2mzKc3simeZJNYQ/ak+As
         kzq/S58T1eeek4iBdRevZE51zAtnv5I+c7D6dQt+30dkRKsEDREwTYgjVhns66q6/Hei
         cQZgPmxAewFH44Uhbx2qehZCh2QtqPsT3mpZsZk+AA70p79IWQi4X+Par+vZ9R+Nz/k4
         dhEXBVYmsrs4q9fxiSZIbcQ6Wqjaw4AMdm74h8lDc56ceZwY8ih54FwS01h9hjdKPjP6
         3+FKkAUFrV8L+vbWrdC7sP2xvYD43RkX3cYeAjiKVMI2ZnWmp1lU/ZQ1GKXwdeeh70Fn
         JgKg==
X-Forwarded-Encrypted: i=1; AJvYcCU8MIDzKGgJxxIqsnFD/iKV8JZ7e2oqe5ITy41Y2/9JnRlLcaZ1+ZxxnonRNMBovJutYGDh4NBwXvNVKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ENJjb0YL1EJRY+vL02Se86VPKKsHwugqU4T0vToWhlou29FC
	BiiVBYelmkxgGrszyiwCjP+Fs/LZg12GA+vwZ4iTfWG3hMvulIqe0XQ3LtrsrNsLojRL6HVwMXt
	PIZan56Ou7w7u9bMLkXvIBYtXP4gcsxpybzuJW5jyelj5aUynj/b6K7qGyYJd/85Nyw==
X-Gm-Gg: AY/fxX5ioWQ3UrPhkQAsoKzPupA4UwT0FGjvDNvKz78zBG1D1ji8HuXkRv1943T8/EP
	/sl1Z2tx9dirpKiVCb+sBbph6c7jPQQ+Feees1Hl0XDdwuFu7Wnk3qGD0t7k0wJvNDH2WWRmqdU
	S4PguWc3VvqkVSAw0qeUTnvUmb277hs6pvU4mrsRmMrAbSkOjaxyp4+CIGbeQ1u+AwsJjMy8ccS
	SvKaXnvSjsI6Kl47E2I9uoCVLc2CPdPV3AMJk04OXNziyyxywUSNqqhV0dZZe5PSk17aFcxGlkb
	6Chp12k3NVbiMfWzrT6L5Pkv2hsm9SsX4u4qF4N7WZQ0gnSobJXPxMM5zgDsKxijqx6ScPRBHSr
	giz5eFN0eoBZgChcEG/k5ze18oYs39zPLJp1Yq1HLvgHrVXePGqjxDQS3PN5j5O12f/c=
X-Received: by 2002:a05:620a:d8d:b0:8a4:5856:e106 with SMTP id af79cd13be357-8c3893699c7mr2422883685a.2.1768315274309;
        Tue, 13 Jan 2026 06:41:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCnFYKDNE5a9Kpl60oqCa1uTX5LiTT50+97M2YvRyxXccubUD1Whh87DmmU9I77dB4do2D5A==
X-Received: by 2002:a05:620a:d8d:b0:8a4:5856:e106 with SMTP id af79cd13be357-8c3893699c7mr2422878585a.2.1768315273798;
        Tue, 13 Jan 2026 06:41:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871188ec63sm735453166b.1.2026.01.13.06.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:41:13 -0800 (PST)
Message-ID: <8379850d-6c81-4cc6-8092-c925d8e90436@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:41:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm7150: Fix
 dispcc_mdss_pclk0_clk_src
To: David Heidelberg <david@ixit.cz>, Jens Reidel <adrian@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>,
        Petr Hodina <phodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, linux@mainlining.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
 <bbcbb227-7dd4-45dd-93a9-023ac445f4c0@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bbcbb227-7dd4-45dd-93a9-023ac445f4c0@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CrYM118rS0N3U_19KIMGNi2SF_SZdtK7
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=6966598b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=pwkY4puPBzAG2pqfMuoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: CrYM118rS0N3U_19KIMGNi2SF_SZdtK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfXzFukiOfey2GC
 M+7tj2+Bn9t7T/8unZPG6YF9zNKARCb14/fKOzgH66ATKBHCP7Wb74+q8Jm1cYq88USHqbydMlW
 8KX8MWQzwaYBphFD5U+G+3jlMfMvsHwrbu6RjqDGE8pgsCh4gfXAtLwPoFVPaQY6/c9B8f2KiPe
 RZOXQ6xyYHci4wNs9Pr0p90fNdU+EMfIu6WcuuERnEG6PNWF0+h15SoOFQKAH6xTh1o+LdtBEO1
 cOg5je6uXvCvwwioEpKtaM+jKr9QZxW+HzWMIKBd6/KxtikyNXvIUesqtefQfpYYlp0q6lwur2T
 wLidOR8mA4Dym8MvRAWpCuySFhU75DEFFcrRT5vNKL7qUV0yaCl5S3L27GnERgodflYa+jNiftJ
 gkXg7nlKuXWTrCEAIRMxpB+w8Lc8XKDlImTERtxFqDFzVwd0FMxtlRyRalZIi+Hf9Gdc5GsAXVY
 P9bZXGOLTqljDixlZFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130124

On 1/7/26 12:50 PM, David Heidelberg wrote:
> On 19/09/2025 14:34, Jens Reidel wrote:
>> Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
>> when switching to it, fixing an "rcg didn't update its configuration"
>> warning.
>>
>> Signed-off-by: Jens Reidel <adrian@mainlining.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm7150.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
>> index 0a7f6ec7a2a737c6f6f0484c71dd80f3dbf758b6..811d380a8e9f9bd8a8f1aecba567ebffdb893f5d 100644
>> --- a/drivers/clk/qcom/dispcc-sm7150.c
>> +++ b/drivers/clk/qcom/dispcc-sm7150.c
>> @@ -357,7 +357,7 @@ static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
>>           .name = "dispcc_mdss_pclk0_clk_src",
>>           .parent_data = dispcc_parent_data_4,
>>           .num_parents = ARRAY_SIZE(dispcc_parent_data_4),
>> -        .flags = CLK_SET_RATE_PARENT,
>> +        .flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>           .ops = &clk_pixel_ops,
>>       },
>>   };
>>
> 
> Hello Jens,
> 
> do you know if in the addition to dispcc_mdss_pclk0_clk_src pclk1_clk_src may need  this flag too?

Yes

Konrad
