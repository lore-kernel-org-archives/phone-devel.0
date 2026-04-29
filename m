Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A43BE647
	for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454307; cv=none; b=Cs2NGbaYTM7pXeHHL6FVsAV7Kqhw+H5JpWq57xrFhgMfXsM3ouVcN+HbO3WrgP5ObL1O9txX9XIlgQtYv1gUsfkRGHmr/wWR6NGgat86kz4SAS72qkDXE7TIZJfd1S9t5m1KlgvolGq/WrqgkZEvE3/xq3jfjb6FqcQ8OO+Mavc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454307; c=relaxed/simple;
	bh=EZUtQyn7RAjCFiclJIFM3vCOLYgR7e24GC6BguHNsNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+wYlerMln7fycabGVF6M5ygmI5+rixjVVgNjzIcmkD3ThjOPEmuS7d8oWXHN2fkxZ3kCJ9Jt6nJMW3kszSNuna38Js4nUgrpvSoEhO/d9Nx5vjDMjxd0G6kkWsxtp1w16hl5Pj1iNJT0G6OHhogWRAl8aDq0iIi7aoaPmmhvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTWCpHbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4qc+lnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTWCpHbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4qc+lnn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppvi3752485
	for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 09:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=; b=nTWCpHbk/e0vTViw
	vkQekcZNZI2UwzG28yVQwRStdEMyKLIXhN0vveD2bXRI3EwS85jgNJrWHUoptNki
	YxGiA7H8nCbXIknac1VC1Tht14S6PhmB7f2WZJBj9Vm50D8QIvFqrl+QpjPWC3UW
	OhWE+n2+Dtku63td0GVPAWV4vYE8i3A23yPDEBHMhwe70XdFTWmhROJoEJY3twwR
	VfV/llY1DI+mQZ/KNbYs9bCHBQkw1UhD2ylIXP20206TViNppWwSc8Oa5s/DPHvL
	Ql6GeH1uJcUdtYmMUPpa6+fi0svbGOKqEpU4lthtmMMyzNk8kMq0OzdfPHDemZca
	SGQiEg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1gsqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 09:18:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d85c53a3eso1029688e0c.0
        for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454303; x=1778059103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=;
        b=L4qc+lnnw2xUAdwY6LNA5K1ylkCvqYs1TesNDK+Vd9LGaKZ2rCuXmg5hDWVKwHbZi+
         jh1llut8ET5k6lgI7v1T8Q7azmDFZYIX38UVB4ucQrRjUBAwODOPZ/7ei/xuMfLVNJLA
         NEdAdyZysjoCq2zBVsKwvR0LUoBI14TTalUyARfAnEviD8iciX/npIocTcac45RNnaPo
         d3uehGGDjEnJUc4jLCPYIPiVl+D1A4aMVeBkmBetZPeU7iKMYEePjQy+nvdpZXhKTWRH
         H5lYSzzOboz0XV7L0awvjAyo8U9AZwrarLAEz+6jCFAg/iG89OUuHvXZkZ8tuu/1jDmR
         ZzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454303; x=1778059103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=;
        b=bqmLJgFf2BXQYX+kQHWTABN/h3MM91MUAcx4Kpb2+04MeSFOyI8Z/iLKGPAj+s80Iv
         pK4jdzqFZCvW+YXQN0LOhPhPOS+VWahUjENDw78r2SeMKgoEbsqTn84c2lQ5pDJzj8S/
         /6HYG05iVJ6Jy/tfYk/78oXivoV7yMleLAzhM5gseSX+XIZ6aNmw/L9ReI9eTV0v7GAe
         QsP8CRWHjDE3ZBM+bms32H0xuNSHo8us3HxZFh1+JzcpCuEOe6jbhqy/RsI1/g82CUgz
         VCIWr1+ZZpUykjPZ6H8YQ0ttSBTKQ/Lsa9C1ZcCPhZi2DzoE7fn06VayLTWlp0iFkSeD
         bxRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8wOtsALrUPxdvFb46wkxT9a6fjiwvZ8bhvcA3p++OEIQuvd+OrtWWbSFYhQl4UOqZBuF10Rc2qLbXhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhY3uqs4uo9RxB+BuFG2mCYUbzTqRKyH+ti73+HiwpnA24tXen
	l12fVn3CK5teW1sCKcHrlW5PW4EjnF8qxp4NPFa89rZAu7rrevZVEEKsbk2JluL+x1wv9WkfV6V
	grxzS+y6sQL29wSm1C6wuh/uqTtCQGIkfgbbnsEaTRjKYflcB/O7S43GeAChvjjCFgQ==
X-Gm-Gg: AeBDievwoOcq+bO1XUa7WujG8/7quVGgWY+hoNgOKiLkFV7IIRpHI+Kbchw7ozToMAA
	zRxxEvODgRAZ507PfjF/MzZVTrfSK9iOQPgOZjPrdrfDWHGK0G6sBXpFR6D0BEx/zXaCSItUx+R
	9mWwXGyXPNp5e8da519dYakHyn1Fs4S/VLj7F6aBbmJyLTqLSnXAgT8RRUX0g4gzXwQU7Z3QhBL
	Xrdg13cFV0UOt6PN+N6K9lo7gj7/h23p3E3LRDk6mAy1G8+W/Bw58CewwjHk1J5etynG58740Lz
	02PY+dN8OkCNTy0Ifkuk9jmUC93Q932KyatbYTF260wHUR2sHI/1DWKZnSeNiLMK0XtB0kotUwT
	XSRC2xSNHSrDLlUltllrpAcqc+Jev2vLeoS/dhQz1MSc4cPkLdBhlNzm2SgURoFxKHX81rDc01h
	Vdr8fvp7E4+Sh5vw==
X-Received: by 2002:ac5:cdd7:0:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573a2bd45c6mr1315614e0c.1.1777454302975;
        Wed, 29 Apr 2026 02:18:22 -0700 (PDT)
X-Received: by 2002:ac5:cdd7:0:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573a2bd45c6mr1315607e0c.1.1777454302543;
        Wed, 29 Apr 2026 02:18:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb986113ee2sm63917166b.55.2026.04.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:18:21 -0700 (PDT)
Message-ID: <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:18:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
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
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <9kBbj8Jr-f6eqC6XfnJPf3gKQD-3WfzXgzl4KEVKhRZlW2_GftgFBsijqUgEvGcgmeFqPwtVquMmibHUMaR_sQ==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
 <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1ccdf cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=2ZlRtKr-XBrgk40BSoUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfXyQ+qnHpZNdvE
 jHspvQcYBN08N7z3F24lo3VLnxmyutW7iC0nWffaHMtLhl7BFxUmVh9m0FQ9kLPdasJwdK/rbig
 vgYtojm2NqKTzKhe5guMku7rN7N+GYMZ7XEHut5UUEKJaw+sWLdHrj8wAtdLzHEuE2+nkC0hH07
 Io5C642051HBgt69JGSGy2ptLu0V1+e022PBlSb4k/bLAfm8HeLqYjfiWM+UxhiQEL8snpskCaX
 6q8nSoUwfQJW6GXh13O7GSxS9FmASGbWbXUhfF+cxTBZ71QE9fylrPFwMuiEmJdXfziCtyXoHyC
 WP83OYzpxT6uPkx3aN7OuevR5rn1/KQQj1JWakypXWlzBQNMf9Mnc5zsFugJh+GPFhp0EpWR8j5
 I7t1cy9MDH5JNw+xZsI4nYLTEEPudHTnZS00XLxHX8WJV5qBnyco6Ikxe5gmRCjRjb6HNU1vKEK
 ESBjRZ94T31eMXiTQkg==
X-Proofpoint-GUID: JhKLg7LWKT5wiCnBeMO3zNDtzp2tq_Gp
X-Proofpoint-ORIG-GUID: JhKLg7LWKT5wiCnBeMO3zNDtzp2tq_Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092

On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>> to these GDSCs to indicate that they are hardware controlled.
>>
>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>> But since they are hardware controlled, they can be switched off at
>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>> get turned on.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>> index 45193b3d714b..420997b00ae0 100644
>> --- a/drivers/clk/qcom/gcc-msm8939.c
>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>       .halt_reg = 0x4c02c,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c02c,
>>           .enable_mask = BIT(0),
>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>       .halt_reg = 0x4c034,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c034,
>>           .enable_mask = BIT(0),
>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>       .pd = {
>>           .name = "venus_core0",
>>       },
>> +    .flags = HW_CTRL,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>       .pd = {
>>           .name = "venus_core1",
>>       },
>> +    .flags = HW_CTRL,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>
>> -- 
>> 2.54.0
>>
> 
> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
> 
> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.

i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER

Konrad
