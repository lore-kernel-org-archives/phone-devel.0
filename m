Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64853FCB1F
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339151; cv=none; b=cs7b7LF79dVuXE5X1ROb2JnUOlVYhz15Wszl7hO22TzgCmz6giIclw2mMFS9ev+bbNXry3BGgnsmcALq0H9TudQG2DYwNzIYAWvNKiacprMt3clrTnr29C6SECwtlM+p835aMQVcKTAQ0gvw5aGtTdUvQnOAsqZWco62fXlnG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339151; c=relaxed/simple;
	bh=3/3NupMV0lpEENgIk+v8OcFOLiygURUAD6GMHrRKatM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfccSaWfpSDuhkKfxGe3nAgGSSaOu/LECDviR3jL5ZGpprZ7UP9KQUgknWcUgqNmuKDdb5FpW7QpDVWrXe71zucZQEy043Ctt6E+ts6nnc2MACLnHY7EjH+hm1waJ6RGGHSD50LPnP1AUev2d0sLLtgAdf2K+J3nbPjjCKfR2Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImHEXVpw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exZusrO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImHEXVpw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exZusrO7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxBBR361240
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=; b=ImHEXVpwZNkclAUP
	yNYErsS5u/DDuiMJAu9BDkRy0enCmK9d4vr8TejeYiCZJijalj3aJWFtZkM5NqXS
	5KuAkPepLzZ4nFyDF8xEtlFn8VRdYeC1TBEZ7hd57qzWEvo38FhndfF6jOJbZ/A5
	ek8KYgcJCLcmPahUgrxM3d/F/o3CQFVVy9Di9f7avaju6LBqMZmpHD7ej/ZHRjLN
	9ztUo9tYWJYEceKReD/U4KPlVJwLFWp7Bo71zOE4h0tbZJC3XdACGzsnmf3l10XO
	sDMxal/U+9wO1JlOJ/NuDONHRCAIz9oiJeDUoqO2z/ugYJjxiQTJ2BRjZ4NWs8+H
	+rsVQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50vru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 11:59:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so12711741cf.3
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339147; x=1783943947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=;
        b=exZusrO7NqWgJVvCj3kSoGGEo56imm2gK7XcZLVBROTGKecYQUk3UnAYzuC48+Lxws
         qo6qzObL9569T3yoTAjPORkBu1xr6Mw9xvMU3eoV0FWyd96CjSJEFwgzRZzWCC9p86Wr
         m9UPR1GfT3LkocD+ItASUhiwm9W3RuzQwvR/HDdrwFNup6YSzPJwgN3/1fskv+bLJfiS
         1llniKS8Gr6tXIT19cUiTRxY8v2nw+ZndHI9E335lcDl73qE3t+sVH6RScsEYHVV9Uvn
         ZdOWPo3R2OK7aaS0yxWRK8fWcD9K2csO1kslrl3oMYqyUciUCwn09Zo2x1NAmoUHMrBA
         E5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339147; x=1783943947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAZKsE+Blh41X8p/E0JP22cz789mxN9eTFueV8X4Rmg=;
        b=jNBE/j6OEi9dIdGRX1AJK2FrcSOQUGXG6hrsXbosIKULN0GaHO5SeaLOyoJVBG9Rix
         Fx1yPvFlGrpGJm1dqIcP/keo9nAUz94hA0HRW08zG00oE1EBGzmLwT2njoIEYfB2wEOX
         VGJRkNoZz9WJ3M65BmFz066P7NbDGApJ/6NKc0UMYcoa/ew6rUls2G98zJqSINzyHHvh
         3ULxw4nLbqJrWCdde8vb95B3ka42KrhIwkOIKcggaoiY/7JVH9lliP7BUc6FpSjKwJjF
         Lg7zsx3KkN7vD56G1ooU/ZP3eREytZhpU00TLJXoBJ3lIdfUf8/lpZacXbKzqND2Vx5Z
         QI4g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+tPIiti69mNQ69mPRLY1LjhSrtcqUyt01gpm/Ig+WPDFrUASuCxy23TI/qbYBGJlC1l4503cUxS7MIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfexHF0m/dfQogFIRxi1RsPJqz3X/jyT4guH+rKt6lG0S/23/
	Rz9Q6fDBSVqYmvRgVS2FpmoeKNmFiTEiR7YAPzc7kBol8QUbv5QwIi8n18O+dx4eUwG7lk6LGIQ
	P4aJIFvgTYaigbH6aVyWez2kuPxEKbpkGFtNPGd1B3pd2nohrdYRf9Fgkps6/vIuGtg==
X-Gm-Gg: AfdE7cnCh7M1Zovyfllh6/WC4LBA1PY/8PbgC+14aUrS5j8YNjti36eUes5Q3zh3aQK
	t47SpmDnz24uQSjzcmSEAoR3KS6ylYa3tUgxSiGdiMx4GNbw84kTIxFL7CUetiXDH1cWMfuRnIn
	JRBcfWyGdwf2H5BfClrHyvPy5jG+DDc0nbJ2hrjcK2JR+rOpw2HaaFEkeDm9XPsk39XRwbED4NI
	0137I3xPFNgVuBoZoh3BCe4S7tIYsjeUC1C6TDhM8PufLxP7DlYV5ojbiSWphTB1wB2/sDoFAhg
	AHuldQvBfAMs5RlCwxWzf4tKJkVhIcCqEWl142KenVRWRRP4sE2dJfntWFHw6LvNUlyp9Jlhg66
	689iHUp3/HknaXfawNaLvMCPzrMP1zSAa8J4=
X-Received: by 2002:ac8:5e4d:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c4be3f317mr84350191cf.7.1783339147151;
        Mon, 06 Jul 2026 04:59:07 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c4be3f317mr84349941cf.7.1783339146652;
        Mon, 06 Jul 2026 04:59:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm3830222a12.10.2026.07.06.04.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:59:04 -0700 (PDT)
Message-ID: <54f5177c-4373-46f5-ab32-fcb452e17a9f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:59:01 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <373bbf80-a874-459c-b77e-a86dc5f75d51@oss.qualcomm.com>
 <323f9495-16f2-474a-9604-c67a3279571f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <323f9495-16f2-474a-9604-c67a3279571f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GgN6i_zr9cIuRhfMMm1S5gOMOrgoKkCm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX5XJfUyw/eDA/
 9jZoZd9+9h4KcPbquhWXa2pLzZqEfQHZpIyDtNq2lCw5q3oMdRAg48r/HZweCYCJ9yKX6uIyr4s
 YukOPL5QwgfC8pb/lirc3VmSvjZWePs=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b988b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_kqV_F9lkCdbSKCJziMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXzuTcD8GXzbpz
 ELNcpP8icn7AzOOPvfX2lAsvD5h1NhCBv52eCIRGR//zbuYzyPl6Hb4luQbdpumq0076m85MEP7
 rq5ACoMDDlpe2VrjYioPJmtLippfNGWBmAd6dNtHePBIgQAvCGasQIkZ5QAQRWNJF+7L/T52n98
 wp98rlR117GsdKDstk0a5rqFm60NkPnM7KsFl3ig/wc4pCsSz6R1Kc+h6pAmO9wj2JYz6OAM3Ay
 8ILllsHZesyMKcJEPNohCGwFlr2HT3TAw3aZvV/ovJ1UWv1bqjd8q9la9dNJWO9P7QHFpVeK3BA
 RXOQYySA01+jrG5sh7JVLl4CiokS6WAaTsidnheDlkofTEe74EUCQTjypFnJwp7FNaYHMmLKsEc
 +fRjH7Lr1h6My+00bBg8Tvejcp+adDlIiizMbPO0T5JkhGPdn1s4/a2RYazs3y9X9cpu3Aq7EZm
 FQVVcy72Ewafp0HLejA==
X-Proofpoint-ORIG-GUID: GgN6i_zr9cIuRhfMMm1S5gOMOrgoKkCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060121

On 7/6/26 11:17 AM, David Heidelberg wrote:
> On 06/07/2026 11:14, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.
>>>
>>> Inspired by commit from Joel Selvaraj.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> This looks good, but since the binding is not YAML, it introduces:
>>
>> failed to match any schema with compatible: ['cirrus,cs35l36']
>>
>> so please also fix that up
> 
> I did :) bff7fad1010eea6f183fb110b54171cf8700ef8e , at this moment in the -next.

I didn't run git fetch at the time, you're right!

Konrad
