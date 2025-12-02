Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00413DDAA
	for <phone-devel@vger.kernel.org>; Tue,  2 Dec 2025 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764687076; cv=none; b=POxoeSC0taBFM8NRcc9/TFgpQddztcQ+HqKdtg+mD7n/TP783GgxRqaYY55+lvSE67M1JbYXre4I0xy6OVB64H5MaQKtpwlo7mP6ygUfDqNKFZHa8u1GMn4+hFfLeqpkKywJ+JZyBrNY0VDR12uL+eOMOETHsLquZTn8REB81pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764687076; c=relaxed/simple;
	bh=0Wu1hlJXMplGjb4V1DfSQwdBERruL3aFYVglXRRNC70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tenP9UWrbLeoHo4CFIP7SXSsZZrQXXryqOkdFRMLKDonRb7LMuZVoovQ8xc2V8aCVERWnCPBBLTJyu21qWqZozAugSMVhiLLyPsrGUIXY8Wc1o7aGw41i7IUlLhNTd06e+DmC+QICbOXK8anaS46pDtReI8BKKGXv7xJr7PVlak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfaqekpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2ihvcwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfaqekpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2ihvcwl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B270Cj41146684
	for <phone-devel@vger.kernel.org>; Tue, 2 Dec 2025 14:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlB3ElUMOiP1Y89wJW3ezSOCwSwzO8U+WlUCd+axo8Y=; b=IfaqekpY3hCJaLqi
	G4VreCwotTgRM3nhfKBOzjNWfF8om7JGyCu3NiunE7krnrqqyfTkF74UH1dLJm+O
	g3NYNE4o9BBxbDIv86JFiuUiQGPV60YtKqUjzRud1LUBpy1+3ey82x5HMdD+1aQv
	c/913yfyvHqA3Dunoy1QOPjLMiJEfOB242wsHpqsTjbV2NMmls8zEmjVM4/AfR8I
	sDKqevoM4+UOXKbtLwKZkgwzougV5UKnMQM+infbJHASMRMtO6P1c0rI2EF410XG
	DwtyV2ZmtHbEAOSliODB3G/l9x9xtMDMrbvQATO6jywdXNwUyBaNY58kPoLjggd4
	U97t0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5eb1b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 02 Dec 2025 14:51:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so17192371cf.0
        for <phone-devel@vger.kernel.org>; Tue, 02 Dec 2025 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764687073; x=1765291873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlB3ElUMOiP1Y89wJW3ezSOCwSwzO8U+WlUCd+axo8Y=;
        b=S2ihvcwlDuVmV8NAcyzT/TTp7CNpgNNbusup/Hn3mrRCsdDw4KrPzJZ81+ZZ9rvD2m
         LfVk91AWlZpVZla4uwJL9tfVdhZlWRaNkaae+B/X6bNrj6XOAPThoc0SpLT2rcw3xLco
         2EP455kBJis5wBD597ykc5FXNhJy6E9NgCRKXmeDsOaNvXxttBkUQVcVHQa/OhtH/+8e
         2l11XnRKBM/5wJSMkDPXYETOBXAzTvOC2iwg76R0W9Wh4SllsfJF+ccTNdl0DDAbsZ4j
         bPm+SRQAU9dVI5xAgpTUfkntS6+ghwn55Nhvd95GUIZktEOMTV3B1dwD71lUL0vAsGJ6
         1ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764687073; x=1765291873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlB3ElUMOiP1Y89wJW3ezSOCwSwzO8U+WlUCd+axo8Y=;
        b=apFFZ4qwy4GVy2axO8uHCA2T2Zui16Vom2miES2l3H3tOJWLNCq7/14LyPfsl18W6a
         0Jc8OYQhrpx77VIA/0SBZG1kKE+sC8aCpqeUee3Q6C+Lp3eZSfCExqG0jlplnnS1b1Kk
         MzDt5MYIpQbMX2/OM1MyDv/9RLqrGhM5BaA2/VNHC9pjNCvnzxTO2JHKdSMs9aScpMdD
         heEM0YEMIJxGoV/IsRu4LW5TKdO2DkwJP36nMA1tzDVdsvRMmU+bSSs5ky8MbaNwAQIb
         G/tQnCjAa9TZXsEOi8QEVApja+36pmJoJE1pcWkm3bJhpC0YX/RfMOwhvbhCCLG9pXRQ
         p0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtR6UUROMQc/s9MdYhZr8fJKnV8lDRmKhZpA6Ox+ks3hJK1AvcBe2sKeucVek46gfXyy/2ko9Zf0iaxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIhZD09RPUia6FIQjV4ZoaAfKFL9/tPGP1oDFzzgyDz9MM3h8G
	Xry1xRRGFTTHYq2lSL5eMoikIO999+Zf3JvYvEfXeBKFoywxKpZsKw632XGS5/u3J3lC0jnSQZL
	bs38NAALv60knj72IVK/Wc+VTmh04Rk+WeD0O1ygWE0orqpM9Gfs/UoKin1/5OlwerQ==
X-Gm-Gg: ASbGncuFolPscrmmy0ELArvWN34E2txt7mQ74TVxq/U+oD4hFrV5N+iYTV4zDjqdaFq
	6qhXt8tw54NT+j0PcrlndQQX6QBMrn5rCkGShFdk53T1LM5Vh/iL1VcaQroHnSqfwNRnQJhaAWf
	/zXjC7J/arfLcmpH9fgVPQZ8+TkNfKsL2RgHxpQJeBniiasrwJ//eyFDoc4hH8RrJbtAVmrlmZ6
	sosVTg/4FbHuT+gg0a6lhejO7rswlwCUfwgBklyFOu12jEUysV+rnnzdhPfSDw/dDoNANRsyYqO
	FSVTuExWMom8g86wJdPMSxgKhAKtcuzsP/idiLlo0tBCBer57cFd3JUuuQvel1Hr/IJlkdypcWd
	Ls9QOYQLeNIXTBFHTrImZOh5Rufz2xNATq7huaNGxNQNVE2oDFhNXUauoYILVFz537A==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr463616891cf.3.1764687072849;
        Tue, 02 Dec 2025 06:51:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFC1AIkd4sZg5NnRZh2dP3Lx7esOqdHbbwq92ke1aK4UNF1Fc3ewf3Fq7Wqsy4C7ZiuLQy5g==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr463616661cf.3.1764687072416;
        Tue, 02 Dec 2025 06:51:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea41sm15652189a12.7.2025.12.02.06.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:51:11 -0800 (PST)
Message-ID: <6d225a32-1846-446f-9c3e-b90f52bc86d7@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 15:51:09 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
 <68a07e54-9f0e-4938-803b-64d6f0c31e5e@oss.qualcomm.com>
 <c95cc75a560d5773c298537f6078949d32d22007@postmarketos.org>
 <0d98d501-85cd-4647-8d1f-126242c220a5@oss.qualcomm.com>
 <6c96f1ea3e156db82435909992995b424817bc37@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6c96f1ea3e156db82435909992995b424817bc37@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pGBfUyQrIPt8KbLvNYTq5oT6kEwhR_wD
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692efce1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W-NSXFCFqqVfUt0Lr60A:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDExOSBTYWx0ZWRfX9G0lzjRaIw5S
 LoqqOi3shSEu/RcKRe+w7xoRT2P3q8VWV2jnCNYu5f3H2X52pSKfGxAiYG+6NR8bY9bHIX7elps
 kbG+Qx9AoF+Gurr+EQJGHqd/+ngr9SDkNqSnM413Kzorhw/NwTheMBaK/KclbQ24KyKbmFGj1Lj
 uWX69ph4U8lT9QId6aHNcHoow4HjxMzVHH8nMHlVGfpDZZKQG7Qm4TQKrqiX4yTMqnjTlpKcg/P
 0qVW/Dbwk55q0YT9sZOVrvj9gYElBvmnpINjKLYXhCjswjaGTAAFL6xBo491cujgRLU33Yygq5L
 DQgeBDEUMwMAt8H0HumjO7sopo9xSNLKVZmmOQ6KgGFrEKBeVaKR3nGbSsN/QIl6GgLVz9gLJ6M
 oX1qe16+NeOCEfombF6XzQOgrpHCzg==
X-Proofpoint-ORIG-GUID: pGBfUyQrIPt8KbLvNYTq5oT6kEwhR_wD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020119

On 12/2/25 3:52 AM, Paul Sajna wrote:
> December 1, 2025 at 12:54 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
>> IDK if it's super related, but some phones have additional mechanisms
>> for detecting (particulary the secondary) SIM - any chance yours is a
>> dual-SIM and you can try using the other slot?
>>
>> Konrad
>>
> 
> No such luck. 
> 
> I think the device might have a second sim slot shared with the sdcard (if I put it sideways in the sdcard tray, there seems to be a bit of a groove there).
> 
> But the sim is detected by qmicli in the main slot I was using before, ModemManager just can't tell if it's locked or not.
> 
> The SIM is not detected at all in the sideways sdcard slot.

I'm afraid I can't help then. The modem is online and probably expects
some different handling from MM and/or vendor specific magic

Konrad
