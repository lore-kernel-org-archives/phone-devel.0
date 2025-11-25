Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829252EC081
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114511; cv=none; b=jdy02uFzFLIl3TT22L+Trb1BvZucdT8wbY9HRlRRFM0fxcRuHUWmJncLf2hTujcBz4cyknGaaSU3GRmk4y8JR4dUxdx/cqK9gkIxyPN5Ok8PjRdV7v0ypHKLmcj6YEErtUZxpkK60fBIzCZ3gUc1ocgKoQEftdlDf33qp+geToA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114511; c=relaxed/simple;
	bh=1TXfVPlixmyba6i4iq08P8vC0/duqILVROJdsnsxVr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpxlTAUkey0yQYNRGUnUGWl3R2G7i0ADUYuLWhYAIBwuhzn67NhjIJoCvlHC1s7KK1nzbwM5MbbOYCtMRIuxr6DU8L2lYMi0aWgmrc/lnJ15OS1LJphWkjYy1w3kYmToKjL12kqYPVWKdARTaJP8e7Ebcm4wJtfMQTk4mZNo1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAQ4+Bzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCev0qpp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAQ4+Bzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCev0qpp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APFxxTB2655501
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LaLJMWzhhoL7jF0TkISIME95
	5ZsctfKtB90v8ZvJ6RQ=; b=lAQ4+Bzsij7HP9ZKcNk/rDsdxXaz4VYoKQSOv6i0
	pWBmUB3vRcQLDuVKc2r38Xx5gRNjTXM0Bm/B35rpW5CO7pg0FiftzD5qSrHoSowO
	pCa4kmJ/UFPB9mQxE77Z3Xa4EtGxBehwiZGvjNOsZ668MNh7wBuISgWmY8xawfB3
	pbj/jX6idcpKJWEC9ZebnDsmEj60pEzLuDgYQfhhaZLmic34EvZMwUsP2ShdxN7x
	GlQuKWzPTlu0On7kleXKv2x9RcdcozAyoghJNcQsVSj4De0feitaYxYU4DRyT4eB
	8RZU3+tX0PdY9r8/86vwY1GRNU+okmP3gZM+Z0HEsgGKhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxtdun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 23:48:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so709759585a.1
        for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764114507; x=1764719307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LaLJMWzhhoL7jF0TkISIME955ZsctfKtB90v8ZvJ6RQ=;
        b=aCev0qppPsXyYXWCMCEwhocBwvPwmj6yFrql7CS5fu7CtYBk2OhON79I+53fTtRt0L
         h1K53MNBimDkRPJGNLjmBX7kIKrLLYaquXiMtPweUtV7rqvbD6XhhNOtRmGc9O4Ntm3n
         nw05wNfKLa0ueqru6wbuiTioUSXOWemQUC7Acchib3hBfkhNYLAIeNRs0Hqf/UgXBQyL
         G/Z5TwY5gBl6imCwk8TSjc3jBCeSsT9urOGJ93Nu0cHYqV/5cddjdtB4deJiu7JXgkGh
         VHj+hd6k/HFO/1QncqvhPNZ9PS4HJzNA+4Q/Af+5nlAtP2xiPuRK3B8EBQA18GVgx5x7
         wKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114507; x=1764719307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaLJMWzhhoL7jF0TkISIME955ZsctfKtB90v8ZvJ6RQ=;
        b=COPP8ER68W4Hlkjq7Qt428MrwnQ3avtZslGovl460eKda7cT0W8ZAPH3HSGOM0E5Dq
         JDtCNeNowYmcPfbFkHXrqnP2UgC0aP7zhbrFfE0K2mCxRfyxxNigSj26monu4wkHxSka
         l74q2Py3TUtjLhTZeHKs5th2pcesIqj3H75lkEk9lPUaxbxllK/UqQKqiKztv5pwwgbg
         9Dpgc66+9iWLtih5OkuuP42SkqrtCx3U3j2KHOHJcUDeqzv65Q3ksomog4qtLpI3SA8q
         zJpAEbuI48EouunPoIzNqqKU6aH1f93MDTKEL1nv21DzJB6QS+669sFXJOhbjGs3AOJc
         1j7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrQiKnLrYpDRu0MDg4GEoxooZSiMb9TAinUccYM5luHiVwReWu40sqUvHqJ3qKKfSAAw6b0qNQaCgEEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHb+7JDZOQuX4bQAiokUrES/HgyLafN4IetIfsYdO6aFdRQaLy
	Vm2Y5tFa/HuYiUkITpOnLu/UwUBB8//GvZEMywZ3mAdhMwJIL3IVarpKsQAa1jS3cLjqyF8o9R6
	c8gb5C4hOGmLJo1UvMhAczBJbJoaDU9aTG6ArVH8il0QriWCPsYQZ5/aKwCpK6EYE1zPyghtkWQ
	==
X-Gm-Gg: ASbGncvBzHne7ovVVMLf6yxrJqwkKNc/P93V0enU29DoLgbmQiZUJZwBfcu1zpVF0pp
	eroiUXWr8IQXtsGtbob1WIiXgc+bO1n4LbBmverXzxvFYzp9ox/fR4PZiX2431eUbzkEN7fmoq3
	AzYOOW2/vEVlJdkKMzg65Xyy+wma1da4+1CtxRwPZ7xv47qpPvaQFkLq9TxGRswCqC8B5w5qGvs
	aK7r2ANch77HyR/1yA/7b7cBiePyDpfxKAxcG+Vl9cMr8gNkHaHZAsww8Lx90Pde9pM9cbmrAAb
	ynNDr8qyUQluTi3Djwfkmhe42HxJEvRIz4XwBmUz87fzMLcU+FCQKy+DDhv+Hr+sAGmR/c9EjwD
	0h0iAm9wCQZlsJu5xhUe8ln1bmmHiLTxj5eRDsG8uosSBk7AfUzwt1yzZbOR71XzLq/353DBJnB
	DdsFXI1ZYFcQ9iQczNwu+5Ty4=
X-Received: by 2002:a05:620a:450c:b0:8b1:1585:225d with SMTP id af79cd13be357-8b4ebdbced6mr609942285a.82.1764114507478;
        Tue, 25 Nov 2025 15:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6Iz6guPEwafR2wvdP6krEPpb9fwqNVDu16YYRJcFruP0aUiA6bZ6DvM6LUsWD8DjhuU93Vg==
X-Received: by 2002:a05:620a:450c:b0:8b1:1585:225d with SMTP id af79cd13be357-8b4ebdbced6mr609939185a.82.1764114506973;
        Tue, 25 Nov 2025 15:48:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbccd9esm5511505e87.92.2025.11.25.15.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 15:48:26 -0800 (PST)
Date: Wed, 26 Nov 2025 01:48:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 5/8] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Enable fuel gauge
Message-ID: <rtkhkh57hnmq4vb6nh6wh2no6z52tamt4tiiaplxpon3jrbl3g@pe6cm4hmvj4p>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-5-dd3791f61478@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-5-dd3791f61478@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6926404c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=B0FhMAULOlTCn5wgl4IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE5OCBTYWx0ZWRfX/msuBWWbDISX
 Bk3S0bha7BiqK7LLhusoL86Ne7qjqS1zpVqdjqa/u8d5FxLiK6j9WMm3oZHUgoPqRlYGlr3ctGR
 9E60V3v1bOmHT2fRhZitNi74m3w/e57qAeYd8PFECktn55G+1evVgi8WINUkP+Hg8HhoG01g/Z+
 uKC7kknTuGpbb33EksGHgVcC1mi6z7BuqBIfjkuk+909mdcPqqfetH3zX1icMX6EwXwOIi5HBKs
 a0dWW40r/NunqK09HNAQGG2jrKfZub2bpGn1r9O+IQ8Yf1c08TMhm4AX7W5rMZWlpN7XPy1KQuk
 enPvDvUeyu6bncNIVlCZxiCK5UgxwDaPka4YIIceg==
X-Proofpoint-ORIG-GUID: KfDHffwHS6Yfs1H8plvWTxTXhaFHFDfS
X-Proofpoint-GUID: KfDHffwHS6Yfs1H8plvWTxTXhaFHFDfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250198

On Mon, Nov 24, 2025 at 10:53:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> Enable the fuel gauge and configure the associated charger and battery.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
