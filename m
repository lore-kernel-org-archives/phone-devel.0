Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158162E7623
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433777; cv=none; b=ain8MeGf9KOZOZoNI5T+uaJnwhrhjSyrNBt1uBgV32Hj3UAQiDBNUW1lU0bLEBLJfcJMEdCrgwn0G9Gpsu9s68oxrp6l6l10V3hmlYE+h2oxgbJPbMf4ySlXD3PMNxpEbAGhDs/VJfUjrpIL+5cw38xOzmJpKsehwJ1oDHJ+lIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433777; c=relaxed/simple;
	bh=4kdH9JwWn5BUz8jMj6r/TaxLP/NSVJU/tJpy1sBaGwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMh0eYGO1wKxSHIeK/FcM+XY+U+4Ah5z5G/uV7jpwWH+U0hhIU+d7wOuLR6xaCtwXnt1I58rXF5S/B5ojCmJlhHmux6lhw/hU7MGjYbe3h/IZjKjaAvbxICqj570dMOdaxyLf36HJAVBkBtmzxtLpq1KPhLZRQkojMVmp8mexM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQW0d/3+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQW0d/3+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87H7W018085
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=; b=QQW0d/3+8jWCiqK9
	aXFu4NReDnyno1hQnDd9X1Jx11vJXCyQNNBumCgDiKLY0VZq6lJdEpMTmqI6cQRM
	uU/vTq3EwIHSOWzJj//TDDADPs5EtVlvLL7uyRRYkmvRv9hDI4qf2QyanIPc+S3p
	PP+n9huZ3z6atcPsfZS7gpelklaTApv4fjkZf4OKKEyE9j5k8GsSndCw0R9fcPOG
	Lgdam1Fl81MDIF3bSFYnnJIjdk5b4Oux7IVOvSEhUnjcSgZNygKhi0jhyGokAsxW
	Re/i48Izy0xnUje6crVmv+HE5mSiJdwZqZFpTD+WpOR06Q7qOmS8bm9kgr0xsER/
	ZSUiCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferywfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 09:22:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85e23ce41bdso291744385a.3
        for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 02:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433773; x=1761038573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=;
        b=bsFllt9Nwf+XDh8CQDs/8Fy22JUl8PJaewbkAXapC4cxAmfAVV7FlR2v2rTX4YdCiw
         Guw4ENBqmDuWvFGrZ0NAwRPza2Qiqg4IuzWRfQ2OLVDefxcOx6IOkS1SvqH7ZBV8d0DC
         dpnNAHYsC5mfrsMWMmsWYXWCDhZOUVIE61NkTI4x+cPsfCwBkCfdOnEBec11xkNjwJFf
         5Ljpfg9M0f7ogh/9Kxg4JUbW9uDp3gcoA1QfxJy2vx2pVK3XIaO4vBUn1WeI9u31eddQ
         tK6X7yNTmghYH5cB7+cWpauvJdfjglp/xby7bM2R5y38nI3G9H7RBlNZwilQWjnB54Lq
         jY5w==
X-Forwarded-Encrypted: i=1; AJvYcCVREjL1pHWb8QtLpU/mSUTxeu3NL7WLGOVD126fs2sDSF0ZCvcUsis5hSjBsgSNGEYheODk0Dymng2i2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa++z15ZciX3hanwJVrjbrqw81h/fKOHQwkuhE6X6s66m2f5IK
	cRzlc1dkeNrKHoDyoDylXS5JOWksh67AfSnucNDUKilsB52HPRhAdJk5iAIQHZf8Qny7nMy7Q6Y
	L80B38h+ePuE2jZXCCi+snj0lPh4oi69CfrKQ1MOeWJOnM84UDSIuqRZ6nM26drLrNQ==
X-Gm-Gg: ASbGncssezRh7vA7CrDQw6cFrjHkMkt447pyLYb289PAVzw+HwbNA6iOpP68rIbo56q
	y8hrmx5Cg8W77v9ZAGojq35HAelDhjroiIM4+cR7M1qYkE2Xzw8u4YhiYQBLHvVB6hFjb3Cbai/
	v6n+Buek7LHF7POhXHdAMgUkwOwiUIzfW87+8QrKQ9zz4MJ1yFJPYAClujd989peLKC8gbVASbX
	3OTe01PkC4IzY8/dEhMnvdsiaDkoT4S2qb8ZMrnAr5GBKbgHuUzHjJa+REEb3rSslbhJ9FYLqtm
	9PS2n/F6JIXQJTO+HvaovyxO2NGWwS38JEC0cLJCxBp4CfMY6xtwD/Z71ralm8qBSpiGWBE3UMC
	V2ysYHkbR1N3xFYxOCSg/VA==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066567985a.5.1760433773145;
        Tue, 14 Oct 2025 02:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6lBPtCjgj5B0ks8xM4dqV/qBR4R1q23vBYNJs1dE8aUXN8FmTT9yYWz5xoRUNmm6qC74jzw==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066565785a.5.1760433772666;
        Tue, 14 Oct 2025 02:22:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm1127034066b.23.2025.10.14.02.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:22:51 -0700 (PDT)
Message-ID: <87650853-3b4e-4a05-b3f3-4fcb8820ea9f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:22:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: sdm845-oneplus: Correct gpio
 used for slider
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Gergo Koteles <soyer@irl.hu>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
 <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee166e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b_3gLtI3ev4ASzC4froA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lntQ6Mg_lLAKmmeA5qe7ihdFTbfv2izf
X-Proofpoint-ORIG-GUID: lntQ6Mg_lLAKmmeA5qe7ihdFTbfv2izf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1g/3JLKFfWJf
 DUhVHeF8d4ixkKF3oDZEEm0VoZrCaJETvBDf23peTlFOJUPnlU+1iCsEH0B7xM2Vs5q8xcQnali
 KQnqJct3tNNgbAsIz5zSLe5vJ5SDpi1tE9iDTfrZon13/Mb2anCatNEzttd9RGJTqzC9MSxspst
 /KkEN2zK6TPLNmzZh52aJDOvjap/S7wvdWC8PjHM9QWlHC1IDDLyu9sFonxbRAiKUA/FHJcZdVH
 q0ucEcPxkP45X33ZztlPxgnoVAXjDwV7YziTuuAD9r0wfDEbOGmDPQW6CVfLIC0bCbJYvkH57lY
 +LlyzRGUUxUZUB3XQEPu6FOZFMqwDP1g3sIaD/4IwJ4wbwBi9nWikBcV5WoHOdTdl8nLmEoLw/K
 6ZYJM9fJ0XRYshDejsU+Sd1oD8ytSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/14/25 11:20 AM, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> The previous GPIO numbers were wrong. Update them to the correct
> ones and fix the label.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
