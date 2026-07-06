Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5442B310
	for <phone-devel@vger.kernel.org>; Mon,  6 Jul 2026 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329302; cv=none; b=RhT83T78hq8PoHl3TX/Z55JPz7aYD7zlFCVtJfff3ksNqIRB9ipUkEHLjz5EIhePQXqKuhwgkjHyL7xHw6r0nTEi0giD5oumqYykyrJn+NDzkbaTYssSnf5HV62vkt9VEKgnUMoVbkMptNisKR4mRp68gIgXLNGl6xzLQ/xCGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329302; c=relaxed/simple;
	bh=dtluOyszjaEVOB5vepSnrwx0MsVZ8OKeN7of4i90dKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoeiCHnwbQ5yq+g8fPwc2IBxTJMYzOdFinMT3e4LNPBNdbNG0N0NuQd4G6vW/7C4s7el+IidqPjKbXzZdoPbStM1pB5IN//NsQ1G0RZYIoTfK0dBUpr8A2Or/JNoaT5+RySisODwRgm7m0so67ZoIK/8SN68CMRTRz4Si3CGafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA+sWz8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5Ocx+6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA+sWz8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5Ocx+6z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666946DB104030
	for <phone-devel@vger.kernel.org>; Mon, 6 Jul 2026 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=; b=kA+sWz8ECxfCB+g9
	MM4hac2OneKBIHewOxgKvm8no/OEjSLkP6/1nMtV5yE53Nnu07LKUR3PaXwJV9L0
	HqSclmxeAhreVSTX9uYDOYuHxpwiZu86mMGG8NdlgwVeiYDNhvLWZCpJK1Z1qDNh
	CG7JxY3jCa++1Es5ex2tF0nDHfzdtyGkye3dUDZdRPHxJccKlAinW+qVv3Z5mqbZ
	cwm1JvH3ft41Yh/CtkI2QUXRum6j6VASBGBnX9/Udqm0IRN3aV1gK48ubycXkvvL
	CApSdEUxMG0MqVff3/s3Hj7/t9o5by24+A2kuYs1+z7xX3unqaUYrGNE1HRHh76V
	030U8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h509ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 09:14:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9198761cf.3
        for <phone-devel@vger.kernel.org>; Mon, 06 Jul 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329290; x=1783934090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=;
        b=A5Ocx+6znVH9jYT2aNceNF4BxaLv+gY+xBcLgeFCMkP24ENvmisPNTSfDzJiSD9Mxs
         6sNh043gCmdt/rBF466GaU8ylt6J1Swci+/EPhP+UVHW9rwfhn2HoYxfOrmC/YlHNX+/
         wwXEreZRViZg8TjNf5wBjIoMlGFTActfXEtJEWWc5qZhYnb1lN1p52r9hjBtCuzVI5Gb
         u1SeqEGAYTEWtqF/sgoxUwgUChZPmqFrWTbEPAQ+no9FXwmVzBZ9+DmFXU6EzuFZtCvf
         XChDcSJ2NLcFQo61aDBWm5Lq4ylKNYHw/+eGjMiyk9RdvXa80gC/lIO+L7JmRCAs0thg
         FPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329290; x=1783934090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=;
        b=b/mePB+sSRSe2bUNcDLvnkx7eKBsLIrjR6X47ZSnYyn5iZgemhHAV+8lISXLFvTdEV
         Oj5A36P+FZVb8G1dEbxNg7dF8rUXoREcvC7CaQncVw9kx4YhpWfumyhhTX8Evlr3O2Vm
         JUbV0Ye9wNQVLWOoWh/DwcM+7+GCouv8ml8PfoZfUX2+1CfZGEkGpvqgzsYPyohvTjDh
         Tx8Iv9sOTd/CZp0UGyFnVGRHKBgj5SEIgruOev+Eah7QEoeUbnxghj6yTCvUi/YzTNnA
         kxJdTP1F9bXpqRLNsdTk+wJcjddSkAaPxD6f3Gr8YKOHMnfmT1md6Vc15A6uWDTMIWAO
         zPtA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0wsbSCwklqE6S1CMazpel+qLwmBAX+XHYX3wu1bZ/Ea5ebtQ8BayLZwgU0APP8n2yJu+UU4NdwHWL7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrAaR0yHXz79WmGXKd0j2TQagsNMyBzYRZRav7p/x45ohF+zN
	ekMFxdGxuG1a69DYs+lFZFHSjSiEcfJYA+MKvN5pyzNi3J+NB1hCibxRYEuU9xfxkmlmpky6mXa
	WaDMKaUFK9FaLoypaOP8TM3oRpXXUil5t/xWXb9xfRNGUucn7dNIneylD2AW1LJS+xA==
X-Gm-Gg: AfdE7ck6Po9yfCy4QB+zgv+RRVaZ3xPOqLmo/ZvIf9iXx5WtzdsKWYPaM2LtaXQis/D
	P5abusB6jXX41hwmriTTXbweeK/BYe20ojGBSKQbWRq+2CxFq59qT4DoQjTS0N8f0ROYZGt5Eg7
	XYeSyQwrDJ0XoXUo+s8z5DToeXaNCIM8S37vtXumL4C3dDtV/9tSA2Ok6sTHz0pqxDwMfcbRJel
	OkGGbX13oFsXEPFfHSxNarJPXTL0R+Eq6PjN76kfZUObSq54jAyNJGdCEMAeDnSrkRU/fLRPmPo
	+lKynwMYyJ7WRT5CB/jKdYuSkY/kvXHvxaZiukCJrGuX6isp3IqDycZdeoBOFUkWu7dJetBX6Yu
	6v9KT023CNnx/fWHGOFNEN2IHaOA/fKxEmcE=
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr91899381cf.3.1783329290566;
        Mon, 06 Jul 2026 02:14:50 -0700 (PDT)
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr91899191cf.3.1783329290140;
        Mon, 06 Jul 2026 02:14:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b605506csm701001266b.6.2026.07.06.02.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:14:49 -0700 (PDT)
Message-ID: <373bbf80-a874-459c-b77e-a86dc5f75d51@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:14:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
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
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YaDfgbYm8U2H_e7HtIvGnWbUKJFOtwEy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MyBTYWx0ZWRfX02KhseMyx4Ji
 qtCjiv/4YfrfK05pQIA/ZlhW258vQDlhRu5D+fdHRGFpKQ+dsUO6DW8DmRhv+CN7cL5qfYO58vD
 ZCyYQu8W1oghducncZK5hahRQpSj7WQ=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b720b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=32KPdnK23d6YPOs0wU4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MyBTYWx0ZWRfX6lIEeFM2VuRy
 qq1mGH4KEBJwziHmzmq4RiCjB0n3uyHJj0p4NZcaVx+pPnQ72Ma8UnJMC7aXsruuTTIMVa0uRtL
 lK8AxC7GMgqTNZK53Q4CzUz6LuiqJBVHOq4g13v6puqQZ3BFrZUviIGaFqeZKpIWJeu/Fag5yw7
 WC/7SOHESZVsut1WqbJHtpZK37mB1q+VDmqNOsezXq8qvhT4hHfmP/X6Xgq/BjwSWIv18sPKkUd
 WuzKpE+4ytQ2ns+iCxL9SpPU8iKC1iix8+WTMId0ekxfHpUnP5ZvflHI1Uur40sAm0dunQs4zda
 RLaCfRad97En0U51RklJZcN2/Fgqv8B/apO+7fP1zwm4OLqNsKdGkQHhHyE3FPQYackUeiohdet
 1UY2YGzYniDQR1gKby8K8HtlgSslHOCWH1OidX67o8UamTKRNRXPsCoIgTmiOnHUVG55s4nn8v3
 Z6wSAstbTdhqeu5HaIQ==
X-Proofpoint-ORIG-GUID: YaDfgbYm8U2H_e7HtIvGnWbUKJFOtwEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060093

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This looks good, but since the binding is not YAML, it introduces:

failed to match any schema with compatible: ['cirrus,cs35l36']

so please also fix that up

Konrad
