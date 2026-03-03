Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588C371D16
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533360; cv=none; b=R46PyNPTkTUil0rY4rWLGjTvmP3AVI+xsjtT0sWXBWHnwCrxMIkI09RNo8gLC4C9kpVZJwJHr1xZH1Rmj2AHs7P+QTor4Or1scSh1T5mrvRcxJXJnt5Edi26su98LGa+o4e6ytI+rnQB+7e0a39I/Qo9srhP7TPVXTJoU76u/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533360; c=relaxed/simple;
	bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFGPjxqe9X3wWzYMbN+ioB8jeoIUhc5OvLN6DMGj65+vQ+XJPnQVVNIl4noRBD40Xs4+VhCtvmmnzhKH5fE4hDIb0boE3VFCMaGbvZALehhUT3wtUYmTlnhoRzpJaFdgds0QPwQHa1x+C/dHHNi9ysyQuKjiaq6LRQR5Ki0ubQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eppOPCUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dP3HccxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eppOPCUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dP3HccxL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nHbm3349616
	for <phone-devel@vger.kernel.org>; Tue, 3 Mar 2026 10:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=; b=eppOPCUxZfrgrBdf
	PcJOFZYfEvc9pXXmVKXCdsKXSUeYcJyuL1+B23i3pFkGR4aXJmwqDavXNeIsuthd
	4NnGNJEm4598saqLbQSoGqOU9NohcedljTSIudsJ+mANc7g5E9UDIM8IlJ2Wc11c
	+7b6gOvmVjHUPOGzn4GKVziixThbb/FnVVR/S8C72P3pREp5LMtPHkgL+oq9Yyxm
	YvcPVdNa/JxhpKxR1Isp1gbSLOEQGmpi/CY3HfBmOUisByyCAzhjiPFsUo0x92YJ
	Q7/aPiqfy7lXJxxl45Jx0wGapHoGZLkKbMpexFe7x0OkTMgBoWBNJyAKSWTHu848
	8mbKSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsactw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 10:22:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb399597fbso373537085a.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 02:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772533356; x=1773138156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
        b=dP3HccxLuTecx9KWt4Tni7D8wcpf+T3E+spvhT+gmOYhu6ZsYjxisVEpNqprpCq/Ws
         OzzgQub3nMtcBnBB8XIVI/WsHCLp33Eq8koQIcMvWjKGwYD7bDvdQrjmoE95ENGm4E2y
         KaqvCgLm7Q6LVOb4vnQjuF2HqS5bhcEjBwySS/dwgl3biCUx2Syy4nFCyaWgyvtHtN8n
         9DsHmOQryW2hjx1ZIavFHhHuS6N3Aicna4pVV9HXnKTeKwxNVBgjsyLn2qX70+1DY/fn
         gIVCDLfuxWD8RzLczIAxV61GMA6Dvo4V3XjXYiGLXSsfRpPHiAH6hfpvntKcsaNyp1gU
         11wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533356; x=1773138156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
        b=PyHpXMkM0xvOcyc1Pmtn21NjY/4DViBmPKX/pEI4VWO+1h8WBnOi2IbSlpb6ZNIBeA
         GZdRvawiL3BUy9SGnZDXTwHCfAtWF3+UDyJO5daAePOo3fafTuhEElvysSBi8guWDlkS
         9mJFjhUfQR97y5flCSIM4zR2IIRYmCOJU0XDq395r5wfqyGiiWfrGONtrvKLYVgZQh85
         A9f/BNkH5x2EJfpTofD4831DgRRuaKAiI31CLh1RZpaoSgA/DiM/WyD0LUBvkkwMvLkX
         9nBYipoiT8ATeQOeqx/87ly/ejMktsxWdSioGZdhDIsCphOL5I7sCsH/cS7W40ajyNUg
         jySA==
X-Forwarded-Encrypted: i=1; AJvYcCXPebHkkt0abkDDgdsD6NvjA6Dvo7jVChh8pUSvLlEGYWpfMkQLc5O7PIwE1/GmfjKZy49B0BCS4mpKlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj5rQP9CZ+Ph2FxGMmWI1Op/v7NrzW/GdWZPMX0wtxCgYBGhL5
	43LIeTWyH3kBkaiXPPV6kZ80ecaxqZaDcPtWCX4JDwjbGJxalTRKrb12Ggf5f0bIFaylxQ7j3A7
	PWk23t5+bbhjV+W8iBwV9NhMbUiozUKGUp+EZ7bdnd2KZ6sIv+x514HMQSNy/okbrGg==
X-Gm-Gg: ATEYQzxST1n9fZWvLYFPEdT//nYvUT6X76DSyVI2RlA+60nbhJekj0ZIENN5vKRgmaH
	AoM4zQaBXFBCbKNgxqjVNomh8tCMdNYh5VsNIpcalVJpjBUnctAY51PAerCKWX2MvcNr9NXTERj
	TGf3FPfaW5BaV2WqI8vQkrr6liBF5Pio6m4HYwZSCsLbv8qlcpCz0RW0S/l90GIaWa4EK0qxsOh
	eBk1hW64KihPWP3TfixnkusDKj/ckjOZPRljj8Y3qlzSsQmVLGCXYKhpxCl1tsBd67dTyrWIAew
	a9XFurrAf33YGQvJWJQPK+l+kGXJtzFLt5CA1z5t0o2B93dJ1dEJMQd1ZZCdUeq7mc+LnB2QM/7
	mnlK3exsnv8/hzGDdwdUBMBPDCeFFUqo5BXD2/FoY6pefW31tc/BaBVgGGhKvZaY5VQ4Oxq/GP+
	QoHvc=
X-Received: by 2002:a05:620a:f0c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cbc8ef8d68mr1595218985a.6.1772533356424;
        Tue, 03 Mar 2026 02:22:36 -0800 (PST)
X-Received: by 2002:a05:620a:f0c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cbc8ef8d68mr1595217685a.6.1772533355995;
        Tue, 03 Mar 2026 02:22:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666c9sm554838366b.39.2026.03.03.02.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:22:35 -0800 (PST)
Message-ID: <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:22:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m8ZnQ4VfISZ5azvmg1rd2mptU1Kh5Fjl
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6b66d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-y82mbY2qW1znAYjJDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: m8ZnQ4VfISZ5azvmg1rd2mptU1Kh5Fjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3OSBTYWx0ZWRfX1NbLLVofTkvd
 CKS9Rot51xw4jvYFsP1CUspsw1YA1ZJy6aKGt4gMRiqdCMPHvQxDl1adW9o7EjkR3H8vmYNSIs8
 xJ/G3HbVVxdWLyHe0DEMc4mPB4fQXsoQ0YEtGNf9Pgct4nR7c7X+NbVXckalkETCkPo2tRAUFik
 l/CEVAFql45L1VTGm18GLOwlX2g2XOh/s482U10OK8pbc0GM/MTDi41Oq19MWqw5Acd4s2y2Wh4
 RZrB1TblhBiwgBloXcTWgNDoTgGTqx+ELvbQGYDWRYI7RQUCKhrEuDqWuI9lujYVJDrNEm6CK0I
 bmzu1qUq67jtFlhYPv2vNtFe7VklNvtG/TTBYEBpGXE5BGo77OUwTrkDtfIHt5mWVZl2s/r4nKE
 rO2j3QPyaJ5NIBiqIrGoYhHX44UG/ey0LbhyygGY6jRn/lNaf/HHURKpMmCm5mTd12Sl6jBbWis
 6RtRwomHjotgFBmLYJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030079

On 3/3/26 11:00 AM, David Heidelberg wrote:
> On 03/03/2026 10:55, Bryan O'Donoghue wrote:
>> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> These values should improve C-PHY behaviour. Should match most recent
>>> Qualcomm code.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/ drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 5482fb5163e17..c612192ee727a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>>   /* 3 entries: 3 lanes (C-PHY) */
>>>   static const struct
>>>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>> -    {0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>       {0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>       {0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>>
>>
>> Squash down and Co-developed-by

Suggested-by, perhaps

Co-developed-by usually reflects pair programming and requires a s-o-b,
and that carries legal meaning.

Konrad
