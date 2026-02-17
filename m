Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93F3043B5
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320198; cv=none; b=GRmwTiTHHbsJxbsGpa8MqtqL9DNba2/fUbpORFOEkP80w65G3O+IqSDCFzzpGnGlg/R9ysfqHVoRW/DkKkx0/AId/qi+sZa20iUup9Q8kb/RpNblbkSj8m71nEH3s0jCpDhFrRAOSbq2lXJ8HcmSdnRZ+XdUipW/VeEXE0EnQVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320198; c=relaxed/simple;
	bh=kguMa6ojH8fV8i3bX6X84bdeoSQ4omG4IY566N8i8eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLvgsNmIxpFacFw4G883q1Igq8iEYMIE2foJ2jPxWSwfb1ahWkG16nBSLkvs218C7Q3jDcp4drXR+OmK+3GIOd2zKlBzHmfh15eQafifGaZ7obuKbIQNxl5Z5AVYID1AAMCu5wJoOW+YPwWTcicLWhPf5kVqX5/Wea1gDREIQDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZZXb+Qj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7DUKmtt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZZXb+Qj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7DUKmtt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8ns4V288000
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAcb0cn1LyMCnzswasDtmZbw0woGumseJLOx2dhYcmI=; b=nZZXb+Qjc3OAKGAa
	NJDtV2Zkg7yGm6D4YAp8Z8em91O9FRCIgTcT0R+JrJhVi207jtupWtmJuWSzoUv2
	qi2MhAZ4m0zHcsaAxe4654PI/wtq1/AeVthNSxDBo+r5BIJ5z+FRMx5iS59TqJZq
	OAL4VRMLqmrYR1dLR0K5OmnS+ssQ3rOLmZKorI0a6C4EA+NZEvs7BMvp4ksRIWXF
	ZzHNp50XJHVkzKoMr/DMNF9qw1Xymb1Gzirhxt7RHHW7MSTIWVUmlIyeu4yVAcbC
	uXfaO+V218bdeR9hf72n6d4I1hK8aCv7ic65OG4HkYjAI1BKr8IJbu4A3AAJtH9S
	Yk/0Vw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrsr8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:23:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506a633ce06so35070331cf.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 01:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320196; x=1771924996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAcb0cn1LyMCnzswasDtmZbw0woGumseJLOx2dhYcmI=;
        b=F7DUKmttP1RiueK3rBTactjdfyvF7D/XQwnYxflqX/tb9zMxv9zqUfQdW6HDImiZKt
         MrZq5AYprENm5VSz+kO3XYrS4fLUL18wfwDCS5gQy5B9tJzfi+hgxPgWQN2I4SOegZTp
         QngnUQpeTMz0B3n3FiiF8sot7Bl1259lzavaNrj03chzGQ5ISaFn9hG34CK9mSmx/VE1
         boKnIFbM6b7kmji7U9emjtRAEO+t+E7+W/9f0VUeq1FT0YWgGDehhFraYV2VZmKkQbdK
         93keMa3w3XJxpbijiCETqtE5dMnAhoV6Smgr1TQMf1JFs+uuiE9Zc8K69bnX0XSDE5Ks
         zxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320196; x=1771924996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAcb0cn1LyMCnzswasDtmZbw0woGumseJLOx2dhYcmI=;
        b=iFPAc6gLVCCrBxhNLIhiqa0frW4YFOglmJbDBq1fFIZ2pg3bAmSyo55RQ7SVxtQ334
         tICYlJaS2LdwUrbwqbEQ7AABM/VgcplKq8sx/vNeWe7RvkeziXcbuROOkwyOC3LiD69q
         Zopy1rd5HK0L51lHbNPZGd5MwaaPA4sPFj8V81RwBERFBhnLczB9XyGEyAj4tH4ICQWE
         wX57xK0UrIbhZb77MG8EtOQ6ZCzaSWi1P0+fcXG/5rDWjlUVtU4KWfYL9w54ctGj9Pym
         fMSInzPge5hd3XkUcUw3WKjPZDT1yYNkLAtWaLfxMXRb1wRKtPhw6oWuW5IdYjmlHznN
         ctIA==
X-Forwarded-Encrypted: i=1; AJvYcCUe57MtDQnxGdAtZTe5VZhItSW0frM/9Srdsw5lugmm4wO8BoprxnayFdXy68+KJXDIPM+3yF9bGy89/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4e2PErYhOg+hlOs+Fu+KkQ6aQ1Bn/xETlGQp1M9qrAWUh8mI
	o4BnEhoz8LkDnJdbKVjOoJgYUQbBH1NVgSY+t0GibgCKIwBPPcV5tJ1cQqxKsLk3PNS4ijqTnsD
	XCrLLeKy0rnEK0MFyB+ZvUJGhHQViFl4VHrit5W3Sc1PIst3n2+N6pSZGfgZ4PqW1jA==
X-Gm-Gg: AZuq6aIfDHbuT0ygAdPKeeJYkSZOyfqtHSz4SY7thVGerWZeUYEFBfcKP1F8LjJrosi
	EVzMbocS2Byu/ljD+4j4HNxTxSQVy9an97pGbTwkRaV4ztpyMcqL3FWUeUIIBgct9ri0tHqTuCm
	z0eZsLvTS7ByvgToki474bTZWKGixdVs0o+JLG5kAfQAkc1PCNSNEZUWxb/yT3j26wTukTOrckM
	BdrRMUhTmLcEhJmYszu7ef6wxMfkM2bTide4OCYYOFrkT6kAyhpk+8JxVHebaeBVYRgaWtB45ZP
	D/vJpaVpM+ct4sfvNVeJJNVVakLZ7nkJKTbie7498VbNHm5wcve07tLwIwNMW9d9Nf1l6zzM78l
	S1aQw7XI7nzJBRRs/6onlP6cXJ2wgFAAR7DX7vT27PL8fwA2UfyBY/UuLj0h63C2leGVtH8WVuM
	3taiI=
X-Received: by 2002:a05:622a:130d:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-506a6b2acc8mr137303581cf.10.1771320195935;
        Tue, 17 Feb 2026 01:23:15 -0800 (PST)
X-Received: by 2002:a05:622a:130d:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-506a6b2acc8mr137303451cf.10.1771320195568;
        Tue, 17 Feb 2026 01:23:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d4basm2250214a12.12.2026.02.17.01.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:23:15 -0800 (PST)
Message-ID: <462fb38b-a830-4c9c-9b6e-3f90a388cf97@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:23:13 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-8-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-8-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69943384 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xTuMNDBKoo2s9YD98OgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfXykW6MvWavDCO
 Ii124duYQ64AOlT3CeUSMwCiqzCQL5ut8G8xEAWISOYkffMZZ2BuSSHLbUhBvWHcf9fHpK821JL
 Kh53ySqDFRRzgdNH5Guoyz5YddLyxzU8oC7Lq/fsUcxp6sUL2n+BaubYDnKSHBh9HCnMfvVxQDa
 ILfr1W4GiQ7JgvlizNv6MyV30uYVBhN9B1McHCzULfbLBjSksYiN06Ytb3T/L+lgWg16P8RbAFU
 swumXvJ7R1ikAuv9Mx5MGyAU7CsZ2zVMzHdhX+sXUZFAN8UB4faoosWUhahpr0Rjal5I/Dokfe4
 aof+Ty6CrtVhzJkB7vLE5Wi/9ik6R7YnXYd9NUVGqRUphnqfjnx1Buf8+gzDtz13U0sWetK5jbo
 PX+Y169od9G1xz+Tv/WlX/B7sHgMa6rMzJyZssjiARScTB5hSZ8x9oDp8YfgbNBx/FgINeP2Jiw
 8+WCmJ+A0OSix5TJyMg==
X-Proofpoint-ORIG-GUID: HdkN5reDOUjEI7iUGoeTVVC2RDgf8Bik
X-Proofpoint-GUID: HdkN5reDOUjEI7iUGoeTVVC2RDgf8Bik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077

On 2/17/26 12:25 AM, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. On closely related SoC (sm6115) this has caused
> DSI displays to not work.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
