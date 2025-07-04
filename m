Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81192D23A4
	for <phone-devel@vger.kernel.org>; Fri,  4 Jul 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630001; cv=none; b=TcwNAoPUu5w+pfDOhEoxXbnVdpn8mE2+CwBHVYexFotl5W9DOrymBq5aF2MWVd3zpGkhUVdnB4q1HCKjpYWP83VWT4qmPrU+Fttm1No9jjjqIxDLAKKC/TSVl+tQzSVEK4opSjMVwnQ+ht444pwcCfV7mBZ5mju2RVQ4oGtJkzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630001; c=relaxed/simple;
	bh=MKwHGKOn7w0r1Lf5ecuBq9Tsh0Nc6l+P14YUHUHUuUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1WQje4E1OaWsK4yUen7LyaX6snBpS1tWpenTRAfR+huxvQFmrGcmJaZMFYjtRi6YdTfmBSgAON6o8p7JVvzvw6V2E3CGu7BfJwKoYJFLdyjQsk/lg4I8fWELXqp5009BEtrvLmkrDeadEG6a2IS806qbnC1y2yKGfEgKrhOxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TefrVS3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TefrVS3q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B65xK019936
	for <phone-devel@vger.kernel.org>; Fri, 4 Jul 2025 11:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwHQZhuMFY2xGJQ2mbeCbIoXx+TFpyI6+fnNo2wASLk=; b=TefrVS3qNMZjmGf1
	+igIX0RHUwi8Dg9Ttc83GCuTMBQ4WlzeRsB+Dy5v5eLUIO0EKeamAg6QQsB0vmfN
	IU1qBSN5bYIkGnOgHzBooRvGyK0js5LINnBGeJ9gqk8bEWphG0LiC2KP/Z3VEeU7
	kkKevQffExNE63V8u4WkStfgazMzhh/9N0LeY+vXPuwzaIgGqn18JKhoamsrl3Zw
	SfDwmz8J5frsX+4dMio2rl/viBV4AdtRAbx8c+odapzivuqu03Ogm+NwNvBJwvE6
	4x5XuQ+j9sJgGArbsTrGemE6fkMarsxzQacB9gjrMI2rZJ3VBLSMk2W9PBnTrfZ1
	URTlkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh84vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 11:53:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d440beeb17so16907485a.0
        for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 04:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629998; x=1752234798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwHQZhuMFY2xGJQ2mbeCbIoXx+TFpyI6+fnNo2wASLk=;
        b=jhBCH7Odc4ACn4sigdQjGSmgq8cUEq9D/GsaJ64fTXeAaFzbVxWoF6dr24iyv4gKoS
         ojPVoov+jFCc2G9dkptfDIRi6fG/zTJl/cFSSmFFFsJxuLTC++eHhbBeXH3LYfCDa0Tv
         Am44xjKQ+TcMrBRxVHqRBfx3mnxizE/eGAsVmI2S4WluKqReO/LymT2LgvgBsvi5G/Gd
         nPTBmKxyJmA8R3dP6VfgBfDUNIJVTAN17I3tti/xff4FYlT4udmRjpu5rTkecizDxnyz
         m+2y4g0h1b1BBpJohL+CMMZcG9JFFnne4fbAL75zpfJu4jQFAlMZ03I5NMyIY93Jb3/d
         26vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqDhzKz0zKlzy6bDnGZKiPYZtDMpNwt1lKVxAZ8cVUP4j2/X6Tc26BlywA9VcOs6VaW++59Tu4upINLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgp4CmeeQpelVbnm/jf2m2fgWqdE67J+TojsBCGcgMJyZatym5
	iI/5n75B1FaZOEgyeBnEZV3kKErfhRJ9SGa6p3rObmXmNaZLpQ2YQe4ZDkgfbHnAwgfSVVHktXr
	lXsUrXL3CT23D5E9WzmN9WUUon9V+kbjhjzqv4JWfff2SxmXOIINfmNvhjplSWkbGjA==
X-Gm-Gg: ASbGnctB0KY+eGm2O42Uid5maXMhHKySHxT5ZaYh/gQvpFTeJePGk6vQKqlIkgCAUX+
	iz9AmYGjiCnXUASh+tqboKL958/HDqNqP25M9HqOrcYKQronr61b4CLPKqp8Oo4ZWt2cmnJg6Oq
	eYgxn8ZE8PfURr4L/SxPinSLwgL+85fyKsW/1wtKaSWME/XKFYiaobtDI8+5S1yaxFwvvmbcr/g
	dobA6K4dx5biFJfDH5Os4j36Nzdg9Uwxr22QRc0xGpilppE/Qf8216asqabun4/2kdGjTdpf8EC
	spo6+5JOFDEVGunWK53Sn7BOGAT6CCLfJDeXuQqxPtscxlAWujLu92Upo/HpTMFhj4inyOi9hqA
	eJ5WsZg==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr119899585a.12.1751629997973;
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPlgLXzQaVRDV5W/CN6Yajx9iz9BViPuW1BhPcQXauAwU9MM5dRRtATbVw3ZexdZDIvcZlHA==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr119897885a.12.1751629997529;
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d931csm164525466b.10.2025.07.04.04.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
Message-ID: <c0908ffc-f973-4fe6-9264-cd038b0e5fb5@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:53:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] clk: qcom: Add Display Clock controller (DISPCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-7-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-7-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX/n4huyabbYZA
 SnJkBaekGmhRWc1blLiSrDgkPYRrET/JD76gMTVnPaWMOFNgiukl68q6xutW8DNaATa8AuaCj0H
 xdGobcJLtn9Ojtm/b4lStyvTOsTA9Gc9HApHvTGaIA5u63BO6oRFEU5IyFg8kjuXPsOMVc7WKCO
 iMg7fTJuUhfSrCCgCOow2nsiBLGV8AFjn8qO6sd7MCDiXrBZAaBCFo4s/SCkvWFtsycdsKo8Nb0
 efDqSp5zBocpXjUrUC3TqdDE9f9v/jCWj/eprSG1vrOOlvyP5qVGpt/6X2VEfS3ZMD0KgNiibEE
 9exzR6zhhEdsJGGBkwlHG/efbVlfjAHSTjJ9ZNuihZTfeuZRpBt3MbY6arKImCuX2jv+MnDW6HN
 zqhAeU1LhfkShetGjzY+nJuYrcWOCg3W/p5ODKjZ0LKXWeRfJsaN4Mykm2dt+xB2EXyfqSjp
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=6867c0ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ygkTYHpWjZnbTFMe8PQA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ZH0EDt6J9PUKCungQSwqq72i7Fl7Tup3
X-Proofpoint-GUID: ZH0EDt6J9PUKCungQSwqq72i7Fl7Tup3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the display clock controller found on Milos (e.g.
> SM7635) based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
