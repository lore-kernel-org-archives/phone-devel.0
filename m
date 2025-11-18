Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADDF363C72
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476360; cv=none; b=NnxRalUwmMiYwIjfUKms7DkyPBsD+f2NODj64k7WGZkVaRRzq3Kr1ZmfnnOi3FSDgQaaamPc5mPJl0if04bFndsmFj83rNSolT26KoKn7mcG3Hk4lREPjsgrNyu1xf0JuXo2RoIyl1T9FAFpI30lkM3mfHLbvFe+oysOq1U07oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476360; c=relaxed/simple;
	bh=Z7TNCmcUKDQodXAV+vzpqE8OixNADxGlkpwNC6kO0B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaYanN6hDO9cE3JLLzLwQ8jsV/i/vPW/VSntdPgM2AO9tbHbY2eeRnEB9aFB5do/6LRYTlVd4wQkl4ifYQIOq0S0q5Vw2AlQs6QUOC5yp9hDXRF+WhIBokU9ZPbiErnl/k0GbS+yTrNcsnbbwJKoSOYU911etdJ9BwvmrHlBY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBQe1EmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE8Ys/aR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBQe1EmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE8Ys/aR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDvSY6384611
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAIyMI0KFd8UWpSda+gD2RVYkSdx4cIpdw9CMs5ONew=; b=kBQe1EmS4eZfWiOp
	vS4KnfiX/Im1sYqdVmgL2FYq/fqcAx360aEVuq5uiSoxJg8sz9b27OSwIjh/plbl
	l052yioUAPJiVKaAxE/od1QCilOis1Hz3Ei7zvPAvT+fbrtnaGVfWOj23dLFY/Xl
	D6AupSJk8NUVzoeUN/sF1hFZCjVIUD44LyvBaDIEy7EoE1RzY2Fbz4iDkufZCXBh
	G354/oPhw8m/CbMGrkZvt0AwchBU+BLg6dCClg+5/s0bc5jzbvSQ8ZhesB3WgOCQ
	phElRHsIm5wjPYEDuDCT8XirAOwtc2L63IAA0db7UAoi2AACGaOGQPQfPMSXNQDZ
	RU1AQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8jrkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so21355831cf.2
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 06:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476357; x=1764081157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAIyMI0KFd8UWpSda+gD2RVYkSdx4cIpdw9CMs5ONew=;
        b=TE8Ys/aRWiVLJdcphJZA27vvH0vX+28WOFFjooHXbdN13xKC3jlrPeM5bD2UMKNldc
         qX4O16DR2Y8bbR1ACh+yxaZDc/wLJ8i6xHtLWa1e3OvIzY94Xo2mMZ0ZD0JS2JQaIc5C
         Yo152469rje40L2LKNEjdpL9k2M6U2ZrH1IlWOAoMG4ixnwgVprcbJ+/iuLqmc5beyVx
         FHpamnYlBcCjkX0KUAYwQ6eLb/lPY64k5NV3LhuXzbTUKZ8NYRHx1HLZRujxjujVKSQ9
         Nq932S4iUcO+dpeRN8Px2GeV08AGfrWEZWJlD1w1V2wT1rqzQSfk5ox3aT3RoLqFYR9D
         AjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476357; x=1764081157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAIyMI0KFd8UWpSda+gD2RVYkSdx4cIpdw9CMs5ONew=;
        b=X2IEVQTb/QOZwXVGARlyyfjjpNnzkLb49VSjxVVy4Eeq8JC/Uc8jclX5cXjVt/8DKt
         fDgl+UJPpWfSX3F+VDGnvWDddZcyC3LnSvnXeXCH+hnsdRyWKH90NOZhHmHYW3460ZX3
         e91qBn1rPGTpE9d2BPbajQmVad5je8siZNJ2vgeUeVv4kR5HQgz2hYDhdldyBWiKttke
         jGQvAEPzBzAlHLg6z8LDcV1Ay/tcOz5QlLB4ENSon0yth0WKXwVQ45mNE9xdsiNflwc0
         IJuGR34S5uMofS579+3rf7Pf4QYPoYaRMBoqWOHbKMFp5ALZtO+blihLcDpDtsnvHeAF
         M4eg==
X-Forwarded-Encrypted: i=1; AJvYcCVEIe+qXWstxjpMFLJL48SnRSXbDyjXroPGQg8YQ5v4Q9xkSrWKr9lg0TVscemKGa9G565m+nrwNC8SIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxLycmmNe8twO+Aq65ZWC4xfwOxBVtjenTT0f1sTk7tNP73nr
	Uca+uHOQ9HZFb0hlz9HFY6JBnXJX0W8arbAEMHogWVF8PUDEji8oFh1I+GnV+tm6Xuwi76hmVut
	wPmP8UD/IABuToarYbDWvvOwBrT4SLxXyoX+oODsHzQKKxs3MEGlRX7pe8wvPGbIVRA==
X-Gm-Gg: ASbGncvDEs/UgwHn71ck/C2Ka4vlVhZRSCbYJmeQ45jVDAd/XyTcrrcWZaUGqdSAvWI
	62hO/QesQF8AgOD6DFZYaaumaFMViXLliSr8UmQccuwKKe8Jq+W0QaD1YlgFZBt0eBGUkFKFOYJ
	JfWcpU60piz2+JiTHEe0nDEYh5FyHHysegvZA9elM8rR9YKQbFr65ZATCzuPQULIM0rw+klrMJD
	5/x/LqJLLmDCXW6LENHaGDJCNpV9wJFl0cqH1HwWdOD9EYCwbGWBqxj6Pf7zCIqFIzX0FQpjewI
	F4EQ3AscmAaoN7UHKNjA0CgyGx/NOpkPVqoapQhbRN6nlHBbfgRfH8xK+s0gMsTl9C9o4FT4cYs
	9SZUreTNseOLpl7dDneLL2MnwUh5yB67tbT+iDfeagNbWQ7JOE54KwK0DHlMQsF56yYQ=
X-Received: by 2002:a05:622a:1a11:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee312afc09mr26778811cf.0.1763476356556;
        Tue, 18 Nov 2025 06:32:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf4+eZtdqVkQt0VpyMvkBuqm4gm7ZauIau1ePIY6CR7MP6U6OvIeyjRN/1kukNb6rjk9yfmQ==
X-Received: by 2002:a05:622a:1a11:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee312afc09mr26778191cf.0.1763476355775;
        Tue, 18 Nov 2025 06:32:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a497f27sm12810665a12.17.2025.11.18.06.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:32:35 -0800 (PST)
Message-ID: <47933d5d-65b7-42e9-bef8-c6e28c80b90d@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:32:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator
 as boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-3-79fb2f0f253b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-3-79fb2f0f253b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 263HUdOl7JN4IHahb4fHWMUOTvBWsXaq
X-Proofpoint-ORIG-GUID: 263HUdOl7JN4IHahb4fHWMUOTvBWsXaq
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c8385 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=_po-8MkxtPHzYxMzuoMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfX4IAjdUznjvc9
 vqR1EtSjdt241O20aLn+hiLKMAg5E+Ap9rCZsSs87GR1+gOmvscT6aYIvddHEvScZv6WcEouEWo
 8og8j/etZlA7+P8fda0JC1/GkunUlBXyQ/0jVxqqW6WJg+qdfnVylmlNf2QzQnehLZxC0IfMAt0
 G5zd0qmqqM0g4i4RmgpRX4gVEJHgoTUEOXRS9e9zBBqB6vB2B/c9LGVOiWyEaVkJF4U5jlZgL2x
 idIcw3PM9LnyL0M643tuh8UQgK/lXGyuTN2nJkYNaTWF9Czzay5IquQOgi1BvPLz8HDrIG4USlu
 VAB7jcNNpraepckzdKzV+we7z+LVLuiPgFJkWWzcWJdtwBDymRHqLS1YzSIctTTLW4aylrq0rke
 5bRDOE67HpN2Xqq87yz2g/F/2ZmNNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180117

On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> This regulator is used only for the display, which is enabled by the
> bootloader and left on for continuous splash. Mark it as such.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad
