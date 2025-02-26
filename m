Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D4224896
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591652; cv=none; b=aYi+2J95WCR5vAGj4NGd+gn4sa9FjsM7gdi9bzKKIPVYuhKQzyUdxmT/OcGZnGaZWf0zcadmRICaNk/SgNmoE977zxYeFxEaVn4st95zNA1k+SCQ13TdrCto5u1odmYS5brQt4PtIV5Z8wmHbqZp1ZN2It49y7pGqBZa+LIO8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591652; c=relaxed/simple;
	bh=zxoFCEm/i4Fsrp5kMYsUFGNq4xymwxtSd66LlDonmFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2rEwnQCDVcTMnFDEHVKvB85mUw9AAaJGgCumdeFRaRvvW99QjyDn8G9fTnz8CYEmmgPslxA7pMMGSZ1vmr1O2xelb4deHy+BxE8lQV4lgLaQWseaIwP1Wxk1qRnlmpfgzELNkMR6usRuVyqGOZg4TuQJ4v/3LhHkorZ+xUmYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2MOR45W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2MOR45W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QD9ZJb001813
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dx9NSFPUTbfMI71GbqxOdXWvocLSr95GYi65otaMCUM=; b=c2MOR45Wq+zUfJXB
	YFD2r5HLErySgksMaZ2bq4+++03Vpo8/PLPmzWEnPHttQjfT3sCdXaQKdp0+Dxc+
	Si6jRpK42MtSZFAgdHYTYODQPvrelvynFaoTk2JbJj1pPGDabxiYYMhc/k1ZNsxF
	TDwLq1nykwTGZUzSZzQKmMLWiYXABRBIXeIVIGxGc4faOnwvm+8wXX2glwBSYXIZ
	1xeTxU8WwQw8wQkr7zdr8Hq8pAKTmjMpUedRukD0/Rj0WDlO8ZuTvVVtSGfnpuTh
	UGqrMXa44biPffYeY1RxtuUH1MBLRUgrwzZ6UVlkC4CqBKoZxWXZ1VR8ErFaBgTU
	D9QfFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4523kc8r1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:40:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e88eea1af5so183596d6.2
        for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 09:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591648; x=1741196448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx9NSFPUTbfMI71GbqxOdXWvocLSr95GYi65otaMCUM=;
        b=XgP0EOkK9HrEimBfABoui03aeyC2XgwnjG57/x5eJYqMMdcNXCbJ6yczGNyTRgPZKh
         ftFzn/mmSMKKMjNp017lNF4gEqAG4JkLrdSwYeXAt09vXq3Di95MTvQBhk6qLLsOGY+Y
         po0GuJIy6AA0T2S3zklvTu2aibM7ME7xcsi9MujhK9EtEtCcf3lgGOxOfSgQpuq1HtE4
         1ipnlNKgCR0weMTcTXR7am0fvQCDDxWcxgN5zvkt9Kw0phoWZhhjWDHlXYMY0zMzQyN3
         Zq+/KxW0cj3ciGMd7jFLVBI9RdwR97z7MQI5FTxylGjP02rXZEhr/YW7PpNw4RlrBfSh
         18cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvYPHOOIMf1wK6gS487rEI3cJnXcByWBssBKFNcLyKpwUhuFoyWsUdtf/q6pzFIJCGRFfiyQNl7dSPZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5DpqXAX4cV7dccqZuvrAnW4WFf+HbEqTOkChO7yKr1EMkMn0W
	v8rj1CZLILKo8avFzNqp8AWBYinMMGPsigRhYcBCAsUCOaoY9Mh3B+pWuXW6HDL9twRwQSlDnns
	nqgHyB5CnVrvn0szKTnwH/yAPFV/QYBOcodxn+LOnXwCnNLl95vxBKzF1ypqlqw==
X-Gm-Gg: ASbGncs3YtF/JiKjSI7Bb2cCcLWKippjuk/o9xJk7xcgK0esUuuXUb6QxIs8gyqUugs
	wMY1NTwOid9unKPD4DC2Htf1tERyxH7jMc/vBX0+10u2Xp2RyUFOs1xasNJp8IoC5AOwwtBZsme
	exVJSIHn207wNZD8YkulXso1DXoa9kZFMBwKlHeA+uqK10D37AiUBeqResEy1M30GxjacVC118L
	gK4lSHU+4mB5vRukXIsfHYWo/fSPeuF3F/6foQQpdG/9Ir70pAcBYQEKeMFDO/k3SnM516zODD+
	nMVOjFzOPmA43YwhjkDOm7lRCXYM8Bmlu64IZ7W0uoBIsKcasZ0ocRKfTLcwBUOxVSVj+w==
X-Received: by 2002:a0c:eb51:0:b0:6e8:8f31:3120 with SMTP id 6a1803df08f44-6e88f313983mr9688136d6.8.1740591647871;
        Wed, 26 Feb 2025 09:40:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETLKJfnGGe63OoYuvkmyhbg6ykFKbgXEtFviZrtLEdWx7MZaKA72KFBrv7wh3/K01a8jQiRg==
X-Received: by 2002:a0c:eb51:0:b0:6e8:8f31:3120 with SMTP id 6a1803df08f44-6e88f313983mr9687976d6.8.1740591647542;
        Wed, 26 Feb 2025 09:40:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205c7efsm366863966b.149.2025.02.26.09.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:40:47 -0800 (PST)
Message-ID: <696aed52-7519-4351-a3f6-7b86778b18c3@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:40:44 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502
 redriver
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <20250226-fp5-pmic-glink-dp-v1-1-e6661d38652c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-1-e6661d38652c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z4T5Z2orb0VwKfhU1-4hgHyX5QwiqTNX
X-Proofpoint-ORIG-GUID: z4T5Z2orb0VwKfhU1-4hgHyX5QwiqTNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=926
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260139

On 26.02.2025 3:10 PM, Luca Weiss wrote:
> Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
> redriver" found on this device.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
