Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38643469E6
	for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688272; cv=none; b=eFSM9I8l8pgyB3Zb7VsKmPiMx7aEqkRD4KWtRyOAZHga7QruQlC+dVx6FcrRh84SaHyIfl7YtT6BaNbIPuxCQZV+jherNwqJCTGrL2y6Vt+xNJ1CBxaIZGYqYNoA/tC9QJ5anLmfsN0+ndPeaT1XsdxiLJdl1mVb7vp7D+HciKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688272; c=relaxed/simple;
	bh=vl/IvMjHQaPAG9h0CsmqVgUy8/dTJ2JHEUpBkVfgozE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0MVNn04uz8SsOYUBMOR6oJZJv4VY2mEJm9FKj9kl2qgQeEfZtrxQuOmWKd5riW3WmeW2toXwLo6NovbnT5MrrCbvQ6OReDqZpyL4pAHY8YLGWq4cJagZt4c7INW0N1k8yuaNIOblOlSDBTrG0kn8GNh6rBlPpBVY0EXszegTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuUsyAIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YabP8PU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuUsyAIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YabP8PU+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ONShXH2024296
	for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 05:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=; b=WuUsyAIWUlyQijQk
	8xCNHknZt3TjwD55WSqnMX1np2l7sh+fHzt4zgIlDmxQK/fvVpOohPz6ojnzDERH
	sz8+MASuZZKwlTLiRJA1ApN2ht+aWkRUV+upRwABFYLkVFk7C/odOhX9kcxdolxO
	8TSxJHA9vAPr4qDpG5uY/kViS06gf3AcUro/OJi+zEya2nHJv1uYgO8d367JKa56
	zKKxL/2hSLus/0luPi9VUs8kLLFJ+kFIoYw9euFE+LTEj7acavFD5Y35BGbNdevE
	q3AxveC5rtonLlNfU+gq/rYoxXABihQSoxjrWoKk6ajyvjvz9fV+Itq8hlsbfCzw
	wSX1/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vbn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 25 May 2026 05:51:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso91225935ad.3
        for <phone-devel@vger.kernel.org>; Sun, 24 May 2026 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779688269; x=1780293069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=YabP8PU+vQmGuLw843AvYJRsknPKbPtbTDz8MdiatTfLU7jD7MvbGrnk/w2nk9tK0g
         8h/GbDfk0cYHRmqrI6iPOHc5TjWSsK+3WbdiVNPzeqZQdEEefoZWr2pkixR1ISgH6wFP
         8bDcGOHDj5Zxh2URrUf9W2qe+Tpmg0nXLb9R9NSURzfWvXSOe6KaWSwjrud1F4SQI+O2
         DSoSzKL58C/9TzgIVYc/11KZAWQr3tLNQuAkn9hdtAbndh8gtTuJFrHTx4hhtuOgqqbd
         KCUJyB+GWV7eidIzohPHhUhtarkcxdoGqIwCeFgCb+2wpKMzbpWivLj0F+sro2dRc9Aw
         o4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779688269; x=1780293069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=oVoErx0A/wh45LASA46Nm96CHFu7nrLtq3l64Xa31MUkjJmkNf8/TCbD3MCAPQ+lhK
         g46sUk+D6ixKSwnOxNerSpq3XLYcz0dXB7LKTOSX9SfVtflFh/yzAygN/sYFhn+Tg93v
         1pzbjKIqj6GqIUha40HfToP1Gx2v6KjQuBwoKvAJAGbFLUJzcEwYQ1tbAQp3bnO8NoIo
         Og/fm8TPP+6/AhS4mvQa5ExltPrZ6O1znDfqMDDUmfzkj50r+XCRPm3MYz8+0MRxaSsG
         MvPflPIgwBMoTxbOzIK9I/ugWrWLcfODG7/o7+ZH5n165SzZzmF0x0zrNF5BGXMQIgpM
         1XjA==
X-Forwarded-Encrypted: i=1; AFNElJ9AfoylfjkLY5Qr2WvDT7u8QnFpSheH0f0AbiG+0iW+fs+eRIKDKWL3XaOwafkKBWtXoGfcGtSKrSYZOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqq6R+c9sRir1VsEzDPZUWC9nJmhSCIuuA41OobbS7qfSrK3/B
	gkaXlj6rVUtkTaRngJIstyKPBNDJjWHeUtuB+VM7G5F4yLPAaRDEMo7laSyeWkcHPnhRUx1u6zL
	EnP1WWPmyPtNDYntEiT4xQ8ypwDO44ziqaGnC4FxiEZvqpsvnD5N/CQkahTq0YfJm0w==
X-Gm-Gg: Acq92OGGLKCQai1vgZrlIWVPnMsodCrlLUPdcCdYQr786t+tXxZe5Hvjwg2JPr/XerJ
	ASUKZPuR9933Z/KFrUCb9zEPU09VnkvAxAlQtOtYh020nDEpzifYSPTl9nkUH36TMsmOeBVU0qy
	ZtD+RaWazCmtd41P5xlzxjhKwpGkDQ1AT8+12/VmRdrDnSIqw9Gvcjgt8USKrnqwrTkJB2fbUVP
	5iDpJ19PfXpntPBaD+O5IWj89khd1uc35hwAKMj5z79WeRkaKSefAsMuTi6i1NSO0Pmhmyb2zlo
	T+lojWHXL1lwO4xh8BzXgbEkO4xnUezbPYTn96ic8Gmp/g9yYILWXpxOYh7H1C/WmXB9E72tFau
	Nsywd5eUEzogOcK/EPKMx8QSRoa/hoI8sjVXpAc459WICrbCO
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233455ad.12.1779688268660;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233085ad.12.1779688268163;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dba7bsm80743675ad.66.2026.05.24.22.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:51:07 -0700 (PDT)
Message-ID: <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:21:00 +0530
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bdPagC6bA8Tv1C2cqYv1xbcGuvAwu9RB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1NSBTYWx0ZWRfX8h9Yc/lAEPSk
 FSjclQvoOBk89aCdz2t1eUIi/3wRynpI1xT+u+GOuwbSyu58ogre8EuvsiUU4NqxtFx+WY9ooQl
 IfVjp0n2f7keXnt6dXPzDtYtBxTzDBbcmEd72mgTXiVcDZmGgJe8CD62ucIdySuY2u875EsLf4z
 d1NRgsBH9SMU7R6tCWcio764gFfI0TVCnLDLWHyIjr1TBSI2PD91FyAfjQe4PEL/8Sg7AVkxzS+
 dJsGkJ2J4xVQDSAHuWKSjXBceRpP+d64zjwMkuwKmLvN+wZOe6dad7M2+b0ADCpBMi+oP9TbAuN
 nxSZpPZhnXpRfbFaeetHO+5NhTnZceg2lwPlUZZsq9N+efhMAD++2TsOBfQhTbMAtFrEyNx8AgX
 dwgeXJ+52r9dxaT6Z7Ui4AIGWgKu+So1iH5u0PMN/bE7F1LwIVdxcBdk5bUyQ38gfq+oDCWw7sr
 ynt6DCBO8XYvh6qP6fA==
X-Proofpoint-GUID: bdPagC6bA8Tv1C2cqYv1xbcGuvAwu9RB
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13e34d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4fXVvXKQPWswVA94wWgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250055



On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>       .halt_reg = 0x4c02c,
>>>> +    .halt_check = BRANCH_HALT_SKIP,
>> please use .halt_check = BRANCH_HALT
>>
> If I do that, the clock fails to power on on boot.
> [   20.324488] ------------[ cut here ]------------
> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at


I am hoping the Venus driver has enabled the GDSC before requesting the
clock enable.

-- 
Thanks,
Taniya Das

