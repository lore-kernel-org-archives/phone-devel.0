Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D934EF15
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603749; cv=none; b=rqeASkE4/Dec9iEVtmi+GJBpmoo55SKUNBYpDMnLFcbiuApfR36BJcwNEzrZfDxEvGEqdITUYqzHKFqASIJlPm77oFk/evTiDbd52iyp2vRFrgfc65aJSnqGeUHUsmJfh2LqDZDf/YxLGBU38BNKcgBhlbzguCzpaIp0QmOu4Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603749; c=relaxed/simple;
	bh=piMQqax2g6RH13aM3sWkhhni8P6cTBws4qC8y6kGTQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBTG18G1lLnW6vvzTUaU7zmMt/6w7Sc+ZMON3nEg6ZnUqW1ryL4z63QueBP11fSDzFDIuZxjRTD0SVafq3tT4HFJazgx6qbkr/x+WKRdw14SHrd7aUxrCvX1nZh3kmJNjCTRGOt/NG0ulg05scqXJ0fDXljXDmnaabk2pT4QziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPcPGnL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7LNTKBG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPcPGnL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7LNTKBG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92ceY041997
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0vH5dYyD2Ol0hVLBm5JvqzOX6K7Jy0+dLdwvbHamro=; b=WPcPGnL72dGefYnK
	xzwGgz4gRymNZEVklraFKbgzTa4vfSf04XoVv61DA+VEgHK82dNs36y1xG2TbSdP
	3xz7JeSwgjT3Mo1yGistlpWJacv2HjHTZnQTmGjkfQq7dcRl+gQkrC6Io63eeEXR
	jUrsh+ztup+4pQTOK/Zd+4MfcAlllpP+lV4qDpddK7rHRTTLo6T/zwJnAOGzlIyM
	9PFMKoN0W0tLxx0dZ2TV6CSSJC8Uo2+72XrQMrCWs3Y0T9k4SQRBUvL5OhCxG+89
	3QlDdB+JXrVi8o8uHsr4EHKHKCB7j78f/q/vuXMXA5hz8IWs+2wXw4zPvQ9X1U3p
	ARu+JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355u1wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:35:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c522c44febso103773085a.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603745; x=1770208545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0vH5dYyD2Ol0hVLBm5JvqzOX6K7Jy0+dLdwvbHamro=;
        b=H7LNTKBGsklySXN49Gs2GuRFG8VN//8Mdr81sMVkx5S2NC3zGC+BlJ6FIVR2pshr0e
         3weVxKM5JSc6sm52fL2tRsAXTajTyP0l9OCe/3jMo964lZwFaFrfBnJAgcZquMAqTruy
         TdPe5m2Q1W/fLlYTwrYJjLXyoaMNteFh4coB/oRlZmt42ZOxI9O5cz6j9/LO5Pb7ArLj
         qSD9t2IpxSsO3OvCqMaWo+8muHbIOFczRjzXPDI84LGAIqffl7uNYOtwgeK1Xv6gaqBO
         dSLZ1SkiZhulh0PwKnmD+UWP1mgHT24TieEY9SXFQZcH9OJkoNwgyCTwPDR1ZTVmc6rE
         XZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603745; x=1770208545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0vH5dYyD2Ol0hVLBm5JvqzOX6K7Jy0+dLdwvbHamro=;
        b=GSHpjY33WdKDKPAqQKB+3JD4zVMUBuhryP/hz0BgS8QPAAsgS72Mxm5VB/lclASIdy
         5m8RdyAk6C2XbDaNKfEwEHmKAQieQgK0Vp7sX40VXKaVnh0FqSyIVofDM5qQiB8xQRj2
         dCp1wvpHQa/svsM5Sh2NyCP4FGoHgAHQvApV2ZVJW5wCZsGG2Sc54VkANhMM3u5vMraS
         Pt06bE59GrnDlPDLLJNW/Zvnlo8TZ/Ubk3CRNfbAwzO7drmKPvoaIF3crBmuNd+fcgjO
         D1bGNjK+xGr700i6HimCT5Bztkteh0dIrinXm9XuzKM0kyP1D1DvGxo3rq4vynaCKDWY
         KrBA==
X-Forwarded-Encrypted: i=1; AJvYcCVWMgJv7nJHF359oIKKbnKZz2vfI053oKbupwTZes8cD+6NV1BUIRLiN0D3S2Jbgvbe8bTESSeOyybSAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOEjUDCUyMGpvztsfDktkrYd+DM+mqAbofuLyEjf/ubooWdql
	NhNNZyX97yPnONEiwXAg8PXLsxla1p0jybLrFhntFmtJ6zgZ5MvsswRbteNF6g1smo6i09k7C2A
	/YprXPJ68y4MP7DeDxVDlR3XWdP4IunaEuTyn4GBQ+PAA9GpqkQ0bem5bl/UQex1Vdw==
X-Gm-Gg: AZuq6aI+t4vROsaz2QawljrHlMKlaUd8enwL8yeuKRLUrWBTNccJsw2ErBcudjGDl1R
	ZNmRIpCIphJXpj70FJQV0llFfZqcQ7lU/O08RGxYLoPlsPVg+HS9ETwxXjxeZZJYm6OS8sPSCMc
	YxIXrukMtA1ZXCZ87swrF7xTfZwglB7A9t5LJOp37v2iWnIFa+wWnoULQoiyhb0snwVCuTVz/Gu
	6TCrFd8iABsOLb7EEoaAPknTGfHgP8srM/9GKXEOGNv3tZTeA7smsaHr/tL9O40iRn7NHCJAaRX
	IM8T+7grDQXeRqE/68kfmViwcqnBWLSMh7JmPnMX1uNv/uF5WV1Q9MdLXVLBMorattrEhv3V7gl
	5nrrEZ/rEwg/3UvSeQJsOU9rHv+3KQEa3owFRqWKb/YrJD46vpwqH6bRUJPswjApXH8k=
X-Received: by 2002:a0c:f08b:0:b0:894:9f0a:7a69 with SMTP id 6a1803df08f44-894dcbb5a30mr1274026d6.2.1769603745554;
        Wed, 28 Jan 2026 04:35:45 -0800 (PST)
X-Received: by 2002:a0c:f08b:0:b0:894:9f0a:7a69 with SMTP id 6a1803df08f44-894dcbb5a30mr1273756d6.2.1769603745154;
        Wed, 28 Jan 2026 04:35:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm1440017a12.24.2026.01.28.04.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:35:44 -0800 (PST)
Message-ID: <0592c82b-021b-4826-8b2e-d9711d8eea66@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:35:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1
 for slew control
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-2-36583f2a2a2a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-2-36583f2a2a2a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697a02a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DtRyXgcbd-FaZx3MlgoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KAs5Py4UjbHNXySHj_oqYumewJrSt1Mq
X-Proofpoint-GUID: KAs5Py4UjbHNXySHj_oqYumewJrSt1Mq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMyBTYWx0ZWRfX5fmmNC1URVkV
 L99Yq8qyXC8xWkMTquTlXrGbA8XGCkQFLxmiFUPzAcY1WQFh6yS4EBvEb9OBQUxZIRN/t4M8nBu
 B00DW8FI96ADJvMZ2IxSitDHt2D9gmcnQcV70jXTH5ky926en7Pm+dBnRN4IWkFpVtDQk980OHY
 MogRa2b8lJTzgzLsEnq8K8eJKFH4loEN5if80F0/cYkD9t6IWMtY1q3JYdbldWcpC1/V16aY6Za
 5awgrkDX/91f+spnPCTWA+Jq3svAMRKUZua9nseSjSOmOgzfqZ7c4AlizxTAjhDiPFuWS8JJkdK
 ia9QFCHEoxS75Ien8nzzSkUxmykQzp+bp2LEOm08cJ41BjrP4dAoxlbh+1LagAWsCLMm0Y2KKx4
 piB3ecR71AmxDkj+52e4IVNi2QdITFtnp5nAwtOm6yUDLkfJ0uVTgckJOmGL5eouCZWxILXC8wH
 yKpRZAPFcylHEqa1SSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280103

On 1/28/26 1:26 PM, Luca Weiss wrote:
> On some platforms like SM6350 (Bitra), some pins have their slew
> controlled with the SPARE_1 register - probably because they ran out of
> register space for an extra pin. Add support for that.

There's plenty of space.. 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
