Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF443C7A2
	for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112171; cv=none; b=iLWhSAHC+WkdyCpL24cUNpmsWTyCSXLyXypldADJjWJdlhYUDYCgJcTIJhJD2pr01FYTrkENYTo7jMCBAAT9yBa31uR7k7hiJ4JzJQuK85imrvVwD2nIM1zlBki445Y9W30fFsQ1UZAZQiTrM/FVZ2/qAcWtfvzjCdnPe9F1pNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112171; c=relaxed/simple;
	bh=9NO6Xg19eD54IlnB31oIGDBM5eDI7zAlqt9sPpTxg+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S09tsK0+xBsEn8PHtgWAZWkppAh2ZYnH+mrUrVL4OaVVrmZ3S6914tS7ftp9IhPjfLP7V65sG65w6Q3Yn7imJug7tLXS7IL+BB8pj+dPTbGVhu40zXY9xynh0NOm79wh0CtjdGlDP15jTjXwYRVyW5OReMh7KVR7a6JiN7FaVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJfSX9gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+y46wyz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJfSX9gJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+y46wyz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9R8Z63143584
	for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=; b=iJfSX9gJMPaBvTKD
	xCzhca+FTeRnhIar5PP9UyGp732a49P2vJwWm3kJksIhkcqu9tZcb3EmUxxkOmnP
	wiq+QZ6kQk4ehZHRoxxDhX+nKZGT53xOHtrluYFFK6lmbp9fxH2qqGgmRUOOWKsM
	9Y/9wVfNg2sHOyGkKswPcm8OvRDEynf8cweZlgwaLpcFBAnByv7GSiFk0DsGJ7MD
	jrd7a+NTfgxrHZIWyPK7z3N7hvMdH2IdyzreoB75+C8Wog3j5BAwRdIWRby+JE9b
	1+La9MwcEqdaQ+UdP4DMZXhwcKmmWq1Qj5OgCKDS5gKSsdFIdiRciprfSAIwb2ui
	DkAs1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka88yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 10:42:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e69a569ffso105016985a.2
        for <phone-devel@vger.kernel.org>; Wed, 15 Jul 2026 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784112168; x=1784716968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=;
        b=f+y46wyzCIcRm73QkS/HhYpcvqg5AgrMD+/Ll4irD9XNIRJVkkyNk3h6Y0wkWu4dU/
         3yK7KeFzBPEdpmre/rtZVOtPrVkulpP4cLEuvKi3I23m6xmcD66YfJNqjeJAScX2ctRJ
         J79U6xvImhLv30kwE/nJ0q+orlgifj4Xw/AowduKJWXyrjwlI4MoBfmzuuKQpPtiLycg
         7I+EyB5Kqh48FQFOCpibQ0eu8szrtdyXRUV/hPss3/w3CG1q9d5bZyWxP8BTU38FErHx
         ptH1oXLu6wT8NrD1tqiQ1erx+Hm07XW0WOjUQ8QTdaSErP2vdaV8lufgKl7JATYvemG5
         FSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112168; x=1784716968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=;
        b=P8I6RmoeadAt7LSASFiWeTkfrn4xVKd5PvBzzagB0EzwFZoQ9gxCrYCT3waJLL1FbI
         f+Pc+r8iF1R/xIbgr6P/YjzTyVCk4CBzK97iPxHW7CugxJ6c+BtCyL+6tWkOYHBTu+m8
         kWmiRBzIHLA00+0CgqhaepokB/CPB6rmNQ+jAUxbSBXbq4fyAYcTgOqEUL6qY00fRdzy
         PaBNCLM1FsOkzbH5Ysxcge6wyJZ1Aj4myw2V6oxKeYLlotf/qRG+A9GNdxGgG/UMbihx
         2Ts4jmyPFLFbzUxrwdfsIELjDv/c0pFz2GuTyfEDO5kV6H9+qgK7mntSY1CUqKXq0oLO
         yu5g==
X-Forwarded-Encrypted: i=1; AHgh+RrhVsSutEvTBKp4490hecI1o9q2tDm/z2dsQSEHTAlbEE3oNl/9SRGGAEVgscfwPhbd3OxUBmaVbK9IjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1L9AHYVCwxFsUtTyFvARwQfhQvoo7vRvUuoRoCpzw9V862BD
	F1pw5KZIr8KD0E5OYWehujZ5sopeGO/BNO79IV9/nsYOBTiHJsUe66wOnS4s3SmyxH0V/JXkA99
	AOydBBs3Ih57VNiIsafSGX94X67iQXd22ZItwoScmxbdyvPX+kWa2TJVO6vV+MXDqcA==
X-Gm-Gg: AfdE7cmvmVOfx9oXmPS/KVDPOtTDQk3HYhO0cMg3+h1UgcChQ7+6cWMIo/4oDkGYcEb
	AdrK3/bqWSEu8S9wybJ05QNpCoralv/UXgp2sYieNYwHTyOgMTUlvxFwTbpYDuqzyzVIGX8QaEI
	eush3Abd5K2GevdZSSdFYycV0hbDWa9clKyF/u1EeBXCKohrMuyaIoFCU6zvft9BJNMTJFvYX0u
	AKke6XcQdfA1hZPGbdMPMjs41qedTVjWDeRAo6GAs9acZjYmIlPAjD70U1r2zTTyYau1JuBEZ/o
	M3cqALgZ4F3BJhj8noFNQHdEbs/2ouIIBjbCgqEfNnKJstG5NF7nydatS9k8PYRdwxXiFCvgCH1
	Jtb6fiKphWkwCPdS7IJQHJh2sCC1KDn2St2w=
X-Received: by 2002:a05:620a:404b:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ef2af8da7mr1347436985a.2.1784112168522;
        Wed, 15 Jul 2026 03:42:48 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ef2af8da7mr1347436085a.2.1784112168078;
        Wed, 15 Jul 2026 03:42:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687171464sm2801666b.19.2026.07.15.03.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:42:46 -0700 (PDT)
Message-ID: <53354eeb-21da-4a9d-868e-970a6c4331e5@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:42:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: fix ngd register base address
To: federico@izzo.pro, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a576429 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=W2E--wPkvXKHDmt8G8wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7o66WB3nkgb6wrebUAvmMpuT12fRfO6d
X-Proofpoint-ORIG-GUID: 7o66WB3nkgb6wrebUAvmMpuT12fRfO6d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfXw8Jjr5OlmHJ6
 nb06RqchC2TjycKilW90MXqh77UQfZprwb9hw7TTnS/7so+Xyn0+O+XUpKmTbESCsIQbofRY3aO
 2bjKiYD1waSCYx8sJGMEUyyA4TlT9rA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX1ZQuIXGmndno
 mgCkp+ygA4SaDKo3YIN+RLjUfGfY8AikxWFK2ZCvhfLDIX323BKt9c845q+MhpaK0XOfScg1ZT0
 blCAac6ShQCOf+xhIpE6QK9d5F33ETbnseZh1e1ugpdhT5AHAlU2oNIHi5s4nFkMT8cBQdiq+dv
 ooNcQ08iV1u8Yf2qN1YaLOWPlyeXF8ornpFJEiEFtsYKJ/yai43/5D2s6ih5ZvfK9tv3CyBaDHP
 C4GoY50vHVjvo9EwW1D/WZIWuQCxUX8kgmqjnr9klz4kqSHFigdBQ6hNJMRKz/iqQqCS6E/hW6A
 wQTevV9bXna9qkMs8CuchvRgDYdY2sZHUqt/9ekH928rkiPQoSENC3/KYvXMVuDMn1doO4dgvEP
 A+GLdHfDMV5kt+tmVuAOY2rmLn8Ay8Cn/gW3lOzKcXgQvoqJ3TQir/JabYsEUQ5V1Lar/g4+pCf
 ra2bguklohZb4ZhRv6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150104

On 7/10/26 12:28 PM, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> The slimbus controller register base was calculated using the
> controller ID and the register size, producing wrong results for ID > 1.
> 
> The expression reduces to ngd->base = ctrl->base for controller with ID = 1;
> but for ID > 1 the other factors produce a wrong base address.
> This bug caused a crash while trying to bring-up the secondary
> slimbus controller (ID = 3) on oneplus-enchilada with sdm845.

SDM845 has 2 slimbus controllers:

AUD_SLIM @ 0x171c0000 (the currently described node in sdm845.dtsi)
QCA_SLIM @ 0x17240000 (the one you're trying to enable)

Each one of these controllers has 2 NGDs (indexed 1 and 2), located
at an offset of +0x1000 from the base of the controller and spaced
0x1000 apart from each other (i.e. the current calculation is right)

You do however need to pass the right ID to the QMI message, so the
bug is in this line:

req.instance = (ctrl->ngd->id >> 1);

This shouldn't be the same ID.

Downstream solves this using a `cell-index` property, which
represents the ordinal of the instance of a hw block, but that's
highly discouraged in dt-bindings nowadays. Instead, the recommended
way would be to introduce a struct like:

{ .base = 0x171c0000, .index = 1 },
{ .base = 0x17240000, .index = 3 },

However that would further need a sdm845-specific compatible to bind
the data to this specific SoC. I think we can introduce one without any
regressions (because the other slimbus controller is not yet described)

Konrad
