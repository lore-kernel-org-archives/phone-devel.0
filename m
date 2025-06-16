Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5529CB53
	for <phone-devel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074424; cv=none; b=RObezYNLqL5tFvVV396FLq2P1tl3Sv/gHTxgX5govPKzuzNv7G5giWlD98uNJ9N66tP4NTZN+M/08gBtaBZkDvWsAGCt8CRIDoR7al6fUqTcjwlB3uUg2PHMJBIm9d3s8Da7rqkJWykF1rvVOWfXjJHd1lKnZo1j0A6QDIv7cFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074424; c=relaxed/simple;
	bh=xvLchH7ZetSbOXKQWka/fIa87mgHsBeuanRIcEntZKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDEV+aPAZWfmeXHUndlYXRZVjo8+dFpSQQpio9gDze6eyNrqhWF+BJz/0pfwp3ExrxwCPWcMtXtOkLaLaV60X+GRE6uE/6q348NL9s7qRjOdprBIrO4hQjoIU24Do+r49YJy2AOonaaamEFj9MKfFxKMgR1wD373zydxOwJFLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSls4azE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSls4azE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8f1Zj013835
	for <phone-devel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+9SjfwuMXgcQnirx7FViLQ3PT3LT50G+ecUzPrY6u8=; b=ZSls4azEotiCruzt
	wxygWg6g3folqNwrjAcwi/leCje0HrwhXKagZzp4fizpOhrBfaCmqyBoqtD+Fz4o
	vxpI42qsVBBa+70L+xBfe/upeSjK7zetvcAKHW7Q8mvWU36js+Tw9ZH6ktYADoDf
	wxqELXZAztffF9nv2qcW9mnOn527aMtUesuj2G/rw/Q4h4lgiKoO3D8P/4hRjib8
	Bf+klAJSix3CkKqssxj6cIT/W9BBYxk8MNZ+q4XasztAsm2ioJtSZI1XffJUsLWb
	F6M6AHiVBGHcDQDvvSn1mxBLn/pI/kdlU7/mJ/6SelJND67IgwAtk5M0DfcPgzoT
	qW2bow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcvbc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso113056685a.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Jun 2025 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074420; x=1750679220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+9SjfwuMXgcQnirx7FViLQ3PT3LT50G+ecUzPrY6u8=;
        b=u8dZHTfmY1wZjk2Nr4XMcCq/3EfRMiZP4JMYtPuzX7UsuAQSmb9Fe+bqvMM9Lcg71G
         pDyyZC0zuVFOxLrMYUngm2kzGrnHBmemAF61BwToidLI06cd8S/2+/n9JBAqbcDbJLwF
         z4sjwqwAjjvXv4sXrnZLeaP3I++WG/hFENgmWL+qzu3A+U6TDl/DMZGE/VBMvISCJKI/
         zPEYAIldu5W7ZcaV50qoo0dU0ReKjUvjwdUAZtjP73lqH3krotjnEgc5B+k1cOLQtr6Q
         cIYJCocsrWJJ0mrhtMkq7qpYY6XHvzxUbx9yL2HHteWvggyoSfGx9+PubI02LRlcmCFU
         Djrw==
X-Forwarded-Encrypted: i=1; AJvYcCUgnwTjuNN6gYdDQqzB8gG+sDyEyNuqam8U2HW7TfQ1T5KakHCCpw5FlKSpNckPENU7ItxY9vhxgQ/McQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVPMYfAZKeyByX+mRw+JkGk3IMB2eluKbL3HnzLE3HX3URGwU
	pNztwTjBAaga2bwLOSnJPGRg/inO0iA/llMCuArqny//I1uAJHe6eVHlbvQuZzOzvd49Tl/JUMp
	ktmHwrF5K3G3eSFwgHyP42EoWzoYUlNFiihKK8ZfkGHYz6wGSLJtRO7nFtXK0cwzj5UScMPdMIg
	==
X-Gm-Gg: ASbGnct3FEHzYGyfRpYvCigx7xEW8aPV+dO66/hQzn3B1hTCPoj+cLFwGG5a69F08kH
	MREPeHN0iX8+AE5uJxQel3JU7nrJM9Lf0QN9WsYnsUi4V1GoByVEKPCEFPpDnZGznfWghxpewcy
	/MaHdiwVX0Bzw/FEev0sg6IiPuiZTHq61yyjt5cW22V2juo0nSJGxLqqAoz1rLSSOAgYT2iaTDu
	u/qT8qZNdTZeoxnifdZtWB6O35j+wrTh6kWqOfoZPNucZLqlQ2Cihb+FShD3GxbBtRNy/nTRXM/
	LWo8h3WK5ZNiiOR42ChHsg6D5OHa6rYNgWvwcV0S2hHMsWc9IiWM/bJ5cFeVCoKWMxJtnm8no+j
	ZzWY=
X-Received: by 2002:a05:620a:6015:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3c6c1aad2mr512720885a.6.1750074420340;
        Mon, 16 Jun 2025 04:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhRDv3gJWoivgwjrGSlbD6D+Z6A4Ncme2M1YfZQGjp7xs3qbRnm8+STTXh6nGwR0vLHAZjiw==
X-Received: by 2002:a05:620a:6015:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3c6c1aad2mr512718485a.6.1750074419855;
        Mon, 16 Jun 2025 04:46:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9ad8a155sm503073566b.84.2025.06.16.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:46:59 -0700 (PDT)
Message-ID: <90be390b-d69f-4862-8f24-b692f41f9bf5@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:46:57 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MyBTYWx0ZWRfX6x2dJVKcxVRQ
 ZzXnWN7m0dacw+SHqPJRactcMPU2DrtK9YiDYs1qU77aSXY/YXVhbaRR1b5NSsL62uZ7CCwGl95
 Xovm8OWt39sQEjiS4sRezBcyEqSq8rdcIcnmDawcRe7k1N1n3Ar8sRlQLSk2O3DDhFzx/mTsOxx
 RX0RzrR6GVD25zfVgTWlCPUgjxQodsSrLiHYmVIWkrLpT6OpmF12BawA8ZdVVB1jrAyw9+VlFoP
 uPBaMmCkA0HUTA3W/lm1Uzo3hbbIMcEHuA3O+9Tfr5aTkQgtXyzk92uJgNoWc17HnM3NLImprei
 ZC7r7lbw28SbP4P+I+vS1gyb3+B1GKz4rbSrdi1qhtUvDnvt5CRu3qEgdxTjzNN+eSyugnwVtDB
 A0se/pSqeyEqeJkCIJqoY2ycffINwThLGwt0jSiIbXDV8rFDA8N2/5N3/JEa2d8RAgpEJeF/
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68500435 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=HDjIzE35AAAA:8 a=3LVZaTluhho0w2aZh4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-ORIG-GUID: rR77opXXr-CGuYro6Rev__PnqocKzpiQ
X-Proofpoint-GUID: rR77opXXr-CGuYro6Rev__PnqocKzpiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160073

On 6/15/25 10:35 PM, André Apitzsch via B4 Relay wrote:
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Changes in v2:
> - Add Fixes and R-b tag
> - Move sdc2 GPIO definitions into msm8976.dtsi (new patch)
> - Remove comments from rmi4 nodes
> - Don't touch tz-app memory region. Currently, the bigger size seems
>   not necessary.

You may want to run the kernel memtest, which accesses all non-reserved
regions. If the device doesn't kaboom, we're likely gtg

To do so, enable CONFIG_MEMTEST and boot with "memtest=1" in cmdline,
boot may take noticeably longer than usual.

Konrad
