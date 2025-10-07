Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050113BC3F
	for <phone-devel@vger.kernel.org>; Tue,  7 Oct 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831519; cv=none; b=b7LXva9WAakdlDoTIOnyjAH+sGW/E556EVXgInn6BbwOjrpq01i3V07M8VesUkDaGUNLK768ovKBEkF2vhQRSQDaOXWKVUoS6uL4qoi4xcGwxa+cSrVF87Dj64/5misuChcPhlhI30L+ZMcXtuUW5WLySYDL/GoM32/cqPtW7Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831519; c=relaxed/simple;
	bh=Sa9j8HUMO81oEGnNcP2btrssXKd5FBC/u7yBtwhyH2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZjdEWPHc5DiLI3K8wiVUft6cYA8vCiOTlHw73hvoAzZQlOGHjoDtsuoxcd1aLI7t3JWc2wzd95ZSlteiuPR0Oc0tsLJaLVztXClBXaZpnlmY+gp2xy58JYIU6N68evo+hRV98yNTIuzJzk8K4tax+zivzsnGnHomv4tlzPMxSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcoTYRP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcoTYRP1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973bmJw004643
	for <phone-devel@vger.kernel.org>; Tue, 7 Oct 2025 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=; b=fcoTYRP1OK9YZevg
	l1/7RmWvGeVOvMXsSXlPsp/VCJ/JzaYX2irH9DJFfbYJW6gPX9VqiP/3VoTSN9+P
	+f0dO5lkrt+05bGOdOuGCKJ/NCCekI4cnO7zKJkbaXQ8fxwoFSriXhqHaoPkNg+3
	hjwhzHhHgtZwfiadxt8c6Sdu4k9imTBXnLSA0I90IPAj0vAWNCsSamoLJOKuhwK/
	gh5/lfV/3ydQWiDXcjKJnj50ciIL+xVfpC42XHuPaC+EiX0IeMKq1kUF2+u97lp3
	7R+ox+24EUvHwVEqL8C3h7ttiyALkVFVLwQJ/8IoRS9z4Qs7mtwMOKB016tKjAHx
	DxLz4w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn75a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 10:05:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-873eac0465eso22798916d6.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831508; x=1760436308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=;
        b=vOqJoazzwJTMZGvk2glDQRoBGo/NsNtPDEV2UUqsOa+RFn6dBSOrst8KVeesIRQDBt
         Q7R8nVxKgF69Jpo69IJY3VPhsZABVEGQbM6xuGpEjy4E6J+zPEqAhvrXNxzXNGJ21fbM
         hFkp61xKGOZC+jrIMBVS2+rpQ4GUeAbIOuHfij71Q10kiOJnVi4TDT0DSfEA2Rc0SZU5
         MY/XlqYmazyHcTNtPgEmQ3ml9Y6ZKz7ZoMhme6ffIB0P7fuKDKiRGeG4sJ4riDpdHblR
         1CdUbJ/OOS1EkzNnw8FzMDjZ0n2nt7LgpPwk8/YaHZWJoCpHFMmumXzf4epk6W0lrg1Y
         SRCA==
X-Forwarded-Encrypted: i=1; AJvYcCWgwAK9Y6Y44ch1IynsPkpx9zO5zm6PcyxG+LnjhvSfEkVXkC2/84Z+h9ORhQB7hvZ/vxhtyo05LfBYOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybJq+eoAxaxfPi4PXYo8WNYN/lk/4SM6F3zKALGmg7Pyfqgf5H
	fpKKUW/FvZbBdodBfY8QlDs2QLoheojlqX/4W8Kdsq8qb65eOp2ZVkDkAIHhF9eJJSGAsNJeR8J
	eoLCfHE5whe8Kt0jGzTV31E80sjt6JDj/765d157evzWcFZX7EqS/hPsCDcfQi8kYMQ==
X-Gm-Gg: ASbGncuj0fgndnE4HDbYeVkaXqp5NrBJuuctggaKAT5zfNq1svWI7AQQPfhRNo7G8lt
	V7BVGF4R+8NMySHd8xoUhO9W5SktkfR1oyWxS6tqvTFa1MOToTZ1bCSnvM2ioLXcDx81y7EQM9b
	S9v2EhF9FVI8w9sG3fA1G3yuWNQp0sFdzrcIHtRS2KDw6UF14+fSh/lcMjVvG8nPhZOtGwAjLtG
	24eN7mPuzfawmILjGkSliMV+m6eNoSKbCmoeHAlYX92zkSDqklIrGrosOm7SJgZDDbDVcQSLO1n
	Vm4k2eQjKzqFzYXQh59AyzpDLxqWXvHadUom3TFjQd/6JYTOtUlvVCM8rJ7AFkl/LEePeID3nEU
	Mmu2bxvp/dGYqnyb+oRfs0YQjTus=
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr135726281cf.7.1759831507868;
        Tue, 07 Oct 2025 03:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt4FfkRc47pl/KPYAeRhUqt4T2owkGAF15yiRG2vKpb73fM3SZHRYcq5Zqrgq4lOY0C0bgxQ==
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr135725961cf.7.1759831507370;
        Tue, 07 Oct 2025 03:05:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1357227866b.49.2025.10.07.03.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:05:06 -0700 (PDT)
Message-ID: <f915951e-1604-4043-8ac6-49f9b123f478@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:05:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX27SoHQ7mvHXG
 j4O1G/X4vt33a23FpZY48dQO3vVeI1mmsE/WwBF0/B+NGdyHJu1nyELigdh0R8Hgx3GYmMYvD/O
 LerAoSwe6BxPZtoT5DGMjLSXT5TVAqYi/Z/nR9yPgkY1wvJPPr+C1bV+eRrx+PrC7BTKy92BHk9
 aqb6Pb0ANiHbiBF2iTeHWil+uULe5d5/iKBVRHMZM/2vIwIpDJ26QyaRQ900sztpTwZWxT52Hi0
 TLJ1wLrsqkoCN+gY/1a7QGF6w+zWQ+U+jegblQ+WY3hzFfW+Elx5P3l9sWWVRAdJ4Sx1JE2UWfr
 IeJXoy0ExqTbx6GusEIoDzlfu+P7X2ZjTAY19W0Y5KjDGTKQbColZlX+JS7SUPqAtM7z9DSfdfJ
 CrnrbCnl38zt4JTW4jwE3h/frrUu4w==
X-Proofpoint-GUID: w2sYUh5-WikAeeLQCKIQ3GAbuN9HcB8P
X-Proofpoint-ORIG-GUID: w2sYUh5-WikAeeLQCKIQ3GAbuN9HcB8P
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4e5dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8
 a=0uX5jv6YKbm2qIkYBgAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the required pin configuration to enable Bluetooth.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
