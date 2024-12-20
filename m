Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F01AAA3D
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687341; cv=none; b=qqqr4CwZzfLTjU7+1TvhX/UZ5jiMCqPjtqXSLMYFZHxVy14921ISRcLNCITagE1zKVJ+IJEHPTFNH1nwx3Gvbm/D8u4+zZuZ87cdahYQsd9wnXnsKUWtYTX5zA0ypO6OcULBTxe4NtHL/3S8Q/zCeV8tiCqa3v+T6FfaJ86jLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687341; c=relaxed/simple;
	bh=zedFkMBUmq0Nn3VJdZuR2Lhi3SZTkWV7cImbJYQqa5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXkZzfwuHb92hQd/kbbHGuZOxgPY87/NVYDre8xjZQzHz2gOXq0KuaF7qXyS8QYMNoYhiZWlAagkt6pb+LiCn6FZC4vyduEPoJP6I/dVzLZriQ6I7nLC6vDah0SnNpOKgsj0wcTIEyDlbYzVfmTUneRd/HmDLJJdDBayo93WjsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuxScu8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuxScu8t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK795Ab024266
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wvf4m/+8J1wY5OlIjVcb1V6YaBDy+XK0fLMoqV0tlg=; b=XuxScu8tfOWRW09K
	0qjLVUZiGDW75uPfsYzamvC+rrdhgI3PuS+vDBLuJPEyV/Ru1OdPzgiOgpEFCmoZ
	BtofhpQpr2Olc9HOg0FU4LZwYHHImzprO3TAhr4OnO1ZQl9tu2glBZXxmTxFRG4b
	Pyr6PIc211JFtaEeEZQ3cVqIUqg6Ba/sb80T8+oEmRP9Hk3OO1Bc9k1TSwE3bP1g
	vqvkUgyhzQyuWEg16k2RQn/5h9BSgsR4rDoKVSFizWOwmzdwkC83fm9eTrOMEYNd
	oIkeD3Vd6++krCmm9jZcPG4EEiGN7LPLH+FVEL+QPJAcEsOxHUu8cEIjurLtPm7k
	x76G8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3xjrdft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:35:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467bb3eeb04so3426591cf.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 01:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687332; x=1735292132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wvf4m/+8J1wY5OlIjVcb1V6YaBDy+XK0fLMoqV0tlg=;
        b=N8HL7Vynf7bYj0hcKr6C3UCkWJQpS5g1vfga9cyT/MGTBSi7IdRtK1xPUAOQxT7Vtt
         aiTPIrj9DcTpdLBrrUJFe+XshOAZQ39hkhzkaqK2MdrlWqUtq4SF5Cr3igNAAfOZci8U
         QJyfpBIcXU+U7aHCXqmh/zoB1qpJznls1BZJEF9EMtcHaIPKxwb7BGxftCKe3Urno9X6
         5rWO6Zs99qGe2TCGPdRC7tWHhWOuaDw51Js0JSDnykkptdaj1Q4kTKhEy3aN/RY9JM6I
         eY2lat91OvZxEU3WIM8skX4XtdflotDFcsv0Q2thmMgHbVBBdR5prRaucs9bpCCMTtPq
         zmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8K2KbhB2NQfYwXwr4Gs/1H2EwoWt1UJJJ9K+rgtEKDDWVfqUmD4BqcCh64TArHpN4pkzqmjX6QtkCUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbWol0tKyDIuWObuD/T6wStkUdrxIllvzfwHHModIB430M/LYN
	pbm4bu+Br7DWlVBZWFFvBNZGgzUZ4jp3D0zIzFqaIzQo807aLGat6AP9qRL19QHMcsYfZnaON9n
	G7RzAuysfxrNy1v6C95qYJ/ID8pCFvGrKW8v6n2poJttBRSfdQOL3rjOp89SfHkTkB3P8Gw==
X-Gm-Gg: ASbGncv/717W6B1/Lra3MKfqrx/4MykqqFOptkSPaIk6MPY66uPyJqjB9fJfHFtKQ7G
	/GZyEpV0FmRjWClSW4xjfBKwj3Ew1T8cZXA394B1hfhxA17LabY+TEjm6SsIu0S9qijW7yttvCV
	7+JO1ikjyDMTc33odlfjHA3RazztnUwutpkd3IOounoS55HRGvGK10a9aHYWghVKIEW9phKKhax
	u/t0cKpB7xFCb9I2fd8WhFdLFw0Rc8fWbzNzSJDuePQArpLM2xjci4iOt+PHXKS58bQcihkaDaG
	P8SZM8xdznw0OhvsrNEZilrTm3DXF9KRvGs=
X-Received: by 2002:ac8:7d0e:0:b0:467:7472:7acd with SMTP id d75a77b69052e-46a4a8b7e3amr15981891cf.3.1734687332280;
        Fri, 20 Dec 2024 01:35:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw19IDdykvlP7lz/VRK0vXRTUP0NYRGCinJslG+yp1jJUp8nxDB71kZfGUwkbxCXHvfdoZyg==
X-Received: by 2002:ac8:7d0e:0:b0:467:7472:7acd with SMTP id d75a77b69052e-46a4a8b7e3amr15981761cf.3.1734687331900;
        Fri, 20 Dec 2024 01:35:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06f942sm156285066b.200.2024.12.20.01.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:35:31 -0800 (PST)
Message-ID: <756178c6-20a4-4ec7-9a2f-6d756097cc84@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:35:28 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Fix uart1 interconnect path
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-uart1-icc-v1-1-f4f10fd91adf@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-uart1-icc-v1-1-f4f10fd91adf@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H5W54Ri_dQoSkcQukFBT1qYfVQUAEkPe
X-Proofpoint-ORIG-GUID: H5W54Ri_dQoSkcQukFBT1qYfVQUAEkPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=917 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200079

On 20.12.2024 9:59 AM, Luca Weiss wrote:
> The path MASTER_QUP_0 to SLAVE_EBI_CH0 would be qup-memory path and not
> qup-config. Since the qup-memory path is not part of the qcom,geni-uart
> bindings, just replace that path with the correct path for qup-config.
> 
> Fixes: b179f35b887b ("arm64: dts: qcom: sm6350: add uart1 node")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
