Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ABA3BD622
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060622; cv=none; b=Ckbor2D/7owIMH4PF20kVg99dAxiYeCaMPfaEOKM3U4+IefPulue49qoyCmUcgKyInGatIHB7OLpedwr+UxQafcN5Epwv/KBnTjzaqU5akb6crLabfK9ki8oWFXcl+yyMYWrBi6si1eYGpeFnvEavR9L6m0SlPlANNilJlSUhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060622; c=relaxed/simple;
	bh=4jULtj9REnh5AmwKY5zTwWslZ8dxgKTzR+k6mD1vXAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKXBvb1FHL9GJ/TND6lYj+x+NaPEj9KSsUHszjB116uOVtv8ykc2kJRVOruQUMQe1D8rvzszSplDlGHRe/wZnBThdk7t0OO/cCCvi6mlo21sGB/1o+OHKxQN/oUAeZVDWM7RGIGWQweRtToA2Tt3w7zbf1gs9pSsFZPJ+p/m7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFTFkS4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8dfBwMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFTFkS4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8dfBwMP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629CZ2mb3050056
	for <phone-devel@vger.kernel.org>; Mon, 9 Mar 2026 12:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJadw+jBAO48uJuNSV3hWYxV0ahs5+z2DeWDEr7t8Ho=; b=jFTFkS4vEM0vzqKN
	J+chGBygG3E/RHwNJ7eqFwJVZVrxOSodpQLS1mFM77AmK128gMC2kHqFsC750f0U
	+aCHVrge+Ow0bXYhbgTTVNSt0/TGroPrDRcEeKUY6jRKj+oyX9EWXWEhdpp2M26m
	0bMC4xs5EQMkzd3ZedE+57tPU08HKefriRajcs+A1AsmTuw+YgE1yqby1Kqwemvx
	J6Dh1GNZ9cYqIsUfPiAbziASJ1DB4ntTZap6OEMgs6g4Jstu7gMMe+5/qKJ68CX8
	tFaXoKUp6+d1NEmlItbd5vJ5W+2gNuYpdoFfFd2qlSPo/PA6Io/UwFdDxGuuOFbv
	72ImZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrnjdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 12:50:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so765029285a.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060619; x=1773665419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJadw+jBAO48uJuNSV3hWYxV0ahs5+z2DeWDEr7t8Ho=;
        b=P8dfBwMPJCbgAtiVWBX5QJ0007Pdmy63C6QZKyVWUcHygwF0g2D0/zzxyv3BbkHrTC
         IVgaxkL5q9N5JPHP3nj2EQszMW1beDpDH0MGpgHgM3CVtGmT/aXokT63ugyKwUQ2ZIW8
         6ZCSWkijuMjJRli4lv7akX+c1EIGKILRAlI1zZJoRhPNHKQUIEIeJUXvHirhUfyRacCt
         LHWIQRxayLCogqvGBwWiuu1Ub4Z8/sq2Onv2RwpzduHqEV6RLnrMvSkt7RAD1Ri0Dyxs
         xuj7k8H0uyva3HPEQHi5/W5/zTWnTY1Qke9KQIr6Yvi3P8z1wwjmiv/KYW1qhmzqpEBs
         woJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060619; x=1773665419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJadw+jBAO48uJuNSV3hWYxV0ahs5+z2DeWDEr7t8Ho=;
        b=CxP4CZfO0+CfbeOifVxoC9rGwSfQcvzjNlYysboKYAIu6mHxbE1XXAdC+0P7rXteG7
         2feQFD80Qu1cJlrK3C04W9Bd0+AJpAtNBbvj1L17tD4KmY7f78nj26JyU7GwcRrioMVY
         hWbDrqc23DTORn6L+kFIiEKDU/W/N9zNhqX35xLpiMCMZ3rvmAtN7RvS/gCpOmQcWh0D
         oKDtx7zkNAERvaE+X4jJfkQvt/B2d8CEvAj94a2X8oJtKXxJK6BRwQDSvBKdsx0oe5qB
         dpSHf0Fp7cFIjUsbKTdmq8bUl2eTsmnEafqkfpK997RDEZh8WJJkdaMeVsGTyU9dVG24
         yv6A==
X-Forwarded-Encrypted: i=1; AJvYcCXpS0YahCEJpORKid0EtJG27WWTGdUptHSTMjo/cG4azOTfVBCaXg+25/PUj593idyax67QshKrz7yeyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUhv9s5GAiXPxHZ3MF+yFHBrqgAUc6DLQEewM2EM2fCq+0LJj
	C8wqgRMPGqLrgveZp7o703/skOXsn6bfKWyRzK+H04t5PDdZLINOSnIbM4Ac343D0tltFfCUJjF
	5BH8XKrHw73ErVnlnMO4sCFMHo+cxHxmY7kAWTuQaMVtiZI3VGtSJrj7HLQLuR0M/6A==
X-Gm-Gg: ATEYQzzBVegioEuiEaRKkTcIBM/DR+VHFv3MKlgaRspUgHjscYvixisd+ywdI7ZiL8z
	AEJ82tbABepswI5EHcf6kTQ3RJuq5fXTrTByX9j2zA5h0g5WW+YLemCTrkoxpBlEO1hqYNBj8o7
	fkMMRs8LvKPxMcpZ1iwd5/f6KqGPHtjsqemzhCBXNQ1avey1+/M33Zwv9MpsQ3ZXnGqBxyRQTvP
	uf6C9BzkD9zQMQ/HCYIZFaLNK5umYYTjzT9RGoyB4kQI6fNsQ8Zyw6ko/RHbzzdaoAWFhNmQc3P
	ozCOA4WnXMmchLAWIh1lDxYPKHXaBIIaYpj32TxlE29WYpSeYZ623y1ciigrbFM0bXnzarIETHM
	B24Uyq50wI7D52AOWNgCJa0FpOWCas9XuYpgHyYEPMayjoCQOzCGUSh/H4Is5Z7OBwzq7m3yk7j
	2m0RI=
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cd6d350fa7mr1066739585a.3.1773060619626;
        Mon, 09 Mar 2026 05:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cd6d350fa7mr1066736085a.3.1773060619163;
        Mon, 09 Mar 2026 05:50:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42addsm375925666b.14.2026.03.09.05.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:50:18 -0700 (PDT)
Message-ID: <7b085eb9-972b-49a2-9b82-25b76fd9ba6f@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:50:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: arm: qcom: Add Redmi 4A
To: Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-2-436f1f4b7399@mainlining.org>
 <e174b1ac-380a-41fc-a1c7-d522e8e75c70@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e174b1ac-380a-41fc-a1c7-d522e8e75c70@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aec20c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=9Zh9aq47Bl5YVDQUYeQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: ml1k6zKvzeBxaBwhnQMkI71-NjYvH4i1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNyBTYWx0ZWRfXyK+WZ5fyeQkq
 CYS0b/3/uD9+1MANvJM+U7d1wi0A2K03TkUy22XDFt7sAdjO2BAnShmssylYgJuUVrblAmZc+iX
 ioY424lyRObe36vj+4S/sPO2dvLd9cW2n0qxc90JkdgIfTLChyARsXMIbWNdhll4E/1KpeG1PBr
 GGiDbXtxGiGRsRVujHkDxjmUVYSxVcCvliEn3uKbkw+q3zcw6i/2zGqyjSZcIyZynk98G4HxZMc
 NQmsGfwu5T/F5xefchBogT/ntlfJ0+k6n+wccflqWMX5VfLZ4hq/YVSik0/M/Yk83sY2SJmZdID
 EbPjU6yRjvmAyOBNS0m74h+CtORDpaWsp6AMsRhPv4KT7fEHjhJyM9cRjTUVB06JcyfYsRirbIo
 vuWpiPiNFTP91sOMYeu4w5B37jUci0XPDJNgZVEziUeoSLCCRb2ULXvNOtabUzVbW2N64rzZlCM
 2CeNASt/d6y4vJe2b+Q==
X-Proofpoint-GUID: ml1k6zKvzeBxaBwhnQMkI71-NjYvH4i1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090117

On 3/9/26 11:57 AM, Krzysztof Kozlowski wrote:
> On 05/03/2026 18:28, Barnabás Czémán wrote:
>> Add Redmi 4A (rolex).
>>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Do not Cc linux@mainlining.org. It causes multiple bounces and is not
> even necessary. It's some distribution list only growing the CC list
> negatively affecting spam scores of sending patches.

Custom mailing lists are great for keeping track of patches within a
team or otherwise a group of people. They definitely shouldn't bounce
though.

Konrad
