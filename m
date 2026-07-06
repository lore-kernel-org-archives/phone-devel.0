Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4AD3F9A0E
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326816; cv=none; b=t4TKDx37yWm0SeKUuMbkgr6o/MIilN6JEr9sjL5Ud/bjW0mk+/FWwb4b6wZ7O58mfC/HM0kcg/cSfMv0eUkaARPcsC7JlXQk/s4f6oBjX/KJN2bPe2pqU8qfahh0/syBEwh0v1PGKm2JWBkmGptkrlLI+sfic0iMAUNEH+nI5wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326816; c=relaxed/simple;
	bh=DqM9Vlg2aPZNJnQZQ/VsD7QqBMtacZIbkNCaz+Jkhl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HG5+ygVw3bCs+9er7hNaykAykSSVwpqLAlOdFVju/gwOPY3iYMDzTccnw26/te2wOk/7GWPR3/Zq2n0nt9+tpjW/r8B87g3dd407m94rWMYNmY+pumTyBuTaJYiYKhh1LaKaKlri/VZnDrQ122fZxl7SQuwGULv49bgSsNdcFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qajac89C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqUY0JAT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qajac89C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqUY0JAT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641U9K3470469
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 08:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=; b=Qajac89CIUayPVvV
	pPzl4yBtgQGpOPBxZYDseQAn/QwNnVLfX3tsct9zjrKkDLurz9d9MNZFMP2fYcZi
	nadTXVu2qYityg1O0IrK8YYGeVv8oDucmTn1MlsX4telnjO1qxYsFkZrJO7rwne5
	cFxIug9ksbnj7Dv47112BinAQrm5mpm0jm2V1PCI+yWGQiCQYTXGsPO8d3ZuJf1h
	TdqD9yvlU+xm0H7lpUdXzAhReFF7yZya2ByTzznYK71MxoXwgMch647CATqABW+6
	W8lWjH2stE52wGDZEw/tXDl3vdVYRbO30cvH5uJZMSpcLzJWEW6QOpVMjnUv6KjB
	xTIxMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen66k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 08:33:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so6472151cf.1
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 01:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326803; x=1783931603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=SqUY0JATQOz9b9YjRXgIlyilDHcyoPe9aCpJSfpMPekywPek5L83t4oeAy5XRwX3h6
         3ZkPlx6YFTGIC3Jrk2G0RMr1GW6zKVbBYY8iO8RD5013nTQ465frsLtp+eyyc04dJrQ4
         XKgcM/WaV+P9jO5U+6/6icFFC1YbimTTBiJE9fC3PqZIgp6slXwD16RgYK8bFNhEYkQr
         juw3Iw87yGsK54GqlhSdAUdG4HCRN8Vf9asDx+RSgugAxWsYWV++OA2dXQz4bEgCJDsF
         ePxrSbESdKkoOYrypxjbxPDfLtGYFGPPdBdLgoJFO0UEuQj/9GOZMN3eIEXfF5VZ6hWv
         TBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326803; x=1783931603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=gaUdKkwtxY87kGwLwhvuXFPNWC4uxBBMWiGoHWFk1Vh0zsyXguhAWnlESOQaEey2fv
         EnB4SaPH88FcaZV0B0xR0xAlPlPRvAQdUz8GMFA98rxdwMh66YZ46vT27JnGEfjzGkoI
         g15YE+pAxPk8pzAXezmnu7DH7UX5GuxAqheWk77fR9ZsinfJgXHuXyZnHsgvYGPg0yPy
         hlJsfFWCHVSg3FcNQNwLCOoFtkRozEGALuB2oHRP5Vjmr50H+rSSfNIS8J270NRGH8MG
         V+PHNNZQEKS4OahSewnff6uk2qdUptKkGGEt3cwSknAHpDHfVWWEl4wpGggVg6YiAx8h
         ZL1g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7U/xCHjZst62wK+6gvRMVH0VJM0lqAe7xOtNUmbna5SyBXBJrEypZopml4A8l0LKwDu41+WfdmIBAow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcaON6XG2xGBhBavh9z0mJHuUEH9Ld3b/RfpnWMyATrqDUPGk
	S+apZ3gbKYLOqTz6IwwVudRQRInV2CApU5gTIn18Y/8A+KIf/T/A/NIeXIRy16wpTYJhQfbmls9
	ekoxKr6MTdt6droLb2Qh3reX3rW31gUa/YahWG0cpyo3HFh5Rsh+XRf7REDQZ/V3abg==
X-Gm-Gg: AfdE7ck5GZLEEv7zKrwLghWZVHaSVTK5M4C2Dt7B5/NXcgZ2G+ITH9u7wf9/rZya8tE
	XRMmdHJZMMAUYbUcefHNcidPUYII7RHPvxVjwe55eY3sIdnDHGw2ohppF8TG+LeP/9gQL7rOVT+
	Yi60K63GczidP36x1vEHILIG3Zo13/ByBM01LYkqfomOAjMiPAtO6XCYwcjVuZG17qpk9GAqnnX
	8yuCyjzJjVgPLPZqoTzuO8cSckAv0trzfwKAUc+zsigWVuWiPAjZ5ZpgeyeDK0XoRcQQASdw4tI
	Ynu0knxLgFOKntkuW29rGoMB23CcT2ZijBtEz1f4Zpft/qYLelqDH7Omkd2qQZiOD5Oodr5OYOC
	pOn/WRWKePi/+XvwwfwOLW4uLa2WVJpBu+zQ=
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589361cf.2.1783326802796;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589201cf.2.1783326802229;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm692511866b.35.2026.07.06.01.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:33:21 -0700 (PDT)
Message-ID: <15493c41-51ec-47f1-be1f-d211a970e487@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:33:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
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
 <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX0mPw0XuFnHj4
 oUL7IR2tSIsGpqorpP4U3hwTZZTOTO0F157meeVIi7tRtpORcRoNsYUrGpTAZAjZcg5/pu+WIih
 QzRoxChfzKXlzdz50Eb7gR0QAYbQGMA=
X-Proofpoint-GUID: ljDQ-lPnHuG7-Iv2c9eEe4YgmUVBx4RU
X-Proofpoint-ORIG-GUID: ljDQ-lPnHuG7-Iv2c9eEe4YgmUVBx4RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX3cZbfqMPN2Qo
 7AQDNDIMMyJaIKF+zFy+O7o7FPuhYXCZkCnwP63a86Y6wdrhkEiK06bTgLiqG/+JfaI/buN5HJf
 adYs3gRkGPFGf4YyzRtoJ4nq6wrw985dPwQKuMSxDavqfPl+qC9NpsvmStzjrfZTObyq5Ho+44u
 WQsQqO8xwMUSX+Xa9cPhAOMVX89BPH3W9CxUA+cvf7J0FU9o7SUf4QRoPjPgJQixIhxcFspHwMu
 dn9ogCdlvq2ItMsA/5ZjTKnOL/cl1TUskMg9UWzX3RBcNyv7Ti/NC4l3r9XXSMiozwm0B7b3rpc
 hJfTpFD0Z5mLPgrsRdl2Ex8wDdt48uGUuo34BD+4uwAFTpCEQerGWvaeK15+jPlemrykou4ROX7
 2z7zypP9LkqaVd0A0Qpv+ldoSFlh1jPIs7xaujMuNfGsI7tazWFqnOEGcPLIgUjHL22LPXMx2QP
 77pfD0CRGKWtHvJm4vQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6854 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SQmynSovjKWGrNaXl4IA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060085

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad
