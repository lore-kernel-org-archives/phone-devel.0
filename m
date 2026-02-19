Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE1D342524
	for <phone-devel@vger.kernel.org>; Thu, 19 Feb 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771513794; cv=none; b=Y8AKQn62WEiflBA6mFU0d9Hyad6gO9G1gxuzt1IVOW16/SGCX/zhybZkFVTvljytdOaa74ofc9CmdB3J28VamkzaclNcBR/GsV8Lk5XOYr8/0euLHSuBqko2RLFNSxgEdYt0Bhp/DT/QpJa5nsi87n/gPThJtHBGMMqzEqLrvM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771513794; c=relaxed/simple;
	bh=S7jFEO9vRalxfn8fN14C5MBAiFQEw81uWfiW74iDBz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKj5mOBhhlveVhYwL7dG4a40j06qQdRJXAcSI7uU2uJ11lLxk4AXfIexFOZSrpCkP/eXJ4joSZsQObhzQ0foet3+EB0FaEWKUBGrLb1bVTeQkebyDMJcRzqkI5d2d+defMEeMRcAWrbRrpDxrLb61BuDoSxMflb22DjoSZYdOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b215ZAX9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFEz2+aj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b215ZAX9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFEz2+aj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCtw5b3915262
	for <phone-devel@vger.kernel.org>; Thu, 19 Feb 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUyHppmBsynyA0S3gPBnETmKaAVRk/FMrQkiLXcFO2c=; b=b215ZAX9CHQTqCrp
	0FLBfdFLG1j54aWI7oFAgKf5Fw2ntokl2b1+aFj8GGP6Qzo0G8ZoPrGPqhhnSYeC
	QdHJh0FPE+KGGsUhygf+XDuR5YW5PgdV28R9JxymeMZqYJDLpO8+oP5OephS3sQu
	2FkVpQWpx1N32M2XbZxlV/Dm5J+57wE0ys/NY/1NASiMsQbhYn8XAJlAaGoLx4rh
	EhxKSN3b6ozfqAo0+mAXKwAzaEijzBWLX7FFsS5sihnw4XprOfY0xzneXgNTc1Pt
	avxubJYSdJ9U+hnbD1bTKShA7tyCaKEbm/7qoD7Hv+O0Sl9Ds2lDAYDFfE5Wrda2
	TwbPjA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqdga3qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Feb 2026 15:09:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fdfed76606so209211137.2
        for <phone-devel@vger.kernel.org>; Thu, 19 Feb 2026 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771513792; x=1772118592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUyHppmBsynyA0S3gPBnETmKaAVRk/FMrQkiLXcFO2c=;
        b=fFEz2+ajKEaYCp46QuszdRr1SmDyPjgiFNcm3tqZblInZGyEYL+K+iSOA0HQu8yXN5
         bCjLrnn3lK44ltuX2h7+4pkKeWh5DC5h+uGW4oCeiV2l/aXYWTAkHQKaK2LHssAFl3i9
         YoWpyUCqesAKTTzxNpCYRgx2HQNqHoaMub9ycLb4WAsZnNe4XWjL736zMIuEU2Bb7+qu
         XxI3IZsrxNRV1s5aqoJmviF/wvlnkfFPnQ4rToCIAi4NAx5Pv4vINvai5G537GFeYovg
         kkeW0opmvXH/bK3i8P/iHgraENi0eLBl3ETVlhBiQevraTCOwHlIOPEtxFAUBeJubgkE
         0NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513792; x=1772118592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUyHppmBsynyA0S3gPBnETmKaAVRk/FMrQkiLXcFO2c=;
        b=RIQKNcuZQ/rosGvJoucNIHMDoi/oevTj9ZqhNWXgKtNxoxzWr4jRaRTtyYyjuL5jmS
         JVbNDV2wsRq6pok8+6aqUQLVXwaBHCW2HZsd6ner/82a1qb0mGSpOS7jVsNzRbKRVcAL
         9/kWPhbu32QI5WHgJbHVxf75OxWrqd7JlLdqUvJ/m/XoQmmmsQpW1iFjSQ519tKUi7UW
         auAj2WvNWsxBwnzMQsjVK6+eV5rW+eMUH1oLUHKlzSEcgzXCbkpQN6Fsb+dSCwI2n7Jr
         BnwNHD256bDIPEFRlz5srGFdCcS+9oVAhXVgu+L7UuTCc66t8C8anM9R8Nlj+Lw6Kqmu
         /prA==
X-Forwarded-Encrypted: i=1; AJvYcCWnEh4lHKXWTBgAdd5lzc3mVVM2fqQucsac7sApyAFjj6tzxXc1qnGf1wQG/osbV8jpDYHxGhmewBq6yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyj6gAWY/F8eGHaCEyYGRck7hT+lJwskJKD0Q/FxYgIlik+q49
	rUsHgX0+VUIUNEeJ+CvgjQHsMOK3Robj1hf7NzSHGprkS4MKquKxGk0RPoilYR5nEByHyWAFS9v
	MuUrWS971PyD65Py3ajBX3szGHQi0XruGk2G0qelGu4ueakiUHDf9TKUJNvSOS9lzrA==
X-Gm-Gg: AZuq6aI4mDwCU+Hb6gpIfmySjnr+ShVLIdrqhOIeKdRoWqwwFObIE6h98BDrKbB78AL
	qRL6aJlOFLR4dVmiW8w/frICH/6RMre9MQmiywTb6w4KpyKafA1OU7iKZDF+8xLoxW87uMYtnCh
	eOzk5l1DqpKUz62WLdOqvxscNgMbZNaglIeKuTRiDRN3W1DT4zLtmhSozLV9AggcWhJK2cmBln4
	ZwpGIhD80lZ2MCeoEBpc+utTLSGte7QJeEq7v3j9zgJDiitH/OzMbyNvek68qVqbFkUi0nt/vMx
	LMzsMwH0wsJyiLPR/MGAgvK34XVglY1jJ4oTic3Q5aMWWKXfUTfOfLvULtLk31QOgt9t0uHirfw
	BXApQaFQF7XJTPPlQEk6eHTIv7KGEcOdXL2ZnLzDviYUxdBRd1468GeHrjfZ/sLC9WAiRSkZY1R
	bZG6Y=
X-Received: by 2002:a05:6102:6cd:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5fe16f17643mr4465217137.5.1771513791631;
        Thu, 19 Feb 2026 07:09:51 -0800 (PST)
X-Received: by 2002:a05:6102:6cd:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5fe16f17643mr4465202137.5.1771513791253;
        Thu, 19 Feb 2026 07:09:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d471sm4087758a12.9.2026.02.19.07.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:09:50 -0800 (PST)
Message-ID: <4057ab1f-494d-4c70-b5fd-8f18783ae7be@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 16:09:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm6125: Add PRNG node
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
 <20260121-xiaomi-ginkgo-features-v2-2-fb3ee94922d0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-2-fb3ee94922d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x81-Li5GtLBNciJhThtAsgvgLzY0VFp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzOCBTYWx0ZWRfX4tydI7iSsHYU
 j2kis7OGOu/3NWvOrJeLZiP5wlnb4iuTzkvDOF78LusjUfgFwkqyALI8E+rZKsylw5JxFK/eNKg
 hF0Pq3jPjm5/4Esh5Mp0kZS+HepHD9CuHPccUxThpPiQO0Gt4gE6Wn4c5w61ExCNggBuiuISQFC
 iRV5jlWaND8B/AjEY96XVrv7IpCb6QuWF5CutZaKwaPrUv3fG+xwLyWQWgUed+q5gm+l7eLAgAw
 0OKhNgd3zJ4ZfhVY2SmZRTc1TIkAXjUUYY6YCmKsxDxoWCBTmJu4QL4AxKFmQI/MWmzaWN/7aZU
 K2YZGhyvpovmUoD8Rqp+UsNupHdyJmrEW+yorpQeZ004lGXdgsbKZ8K4jJbmq0AcdhWvg+bXx0m
 eEGnN5boFuiR1xEPEuDIeVraf13C7TaOAAiPlKE/8KnrYVr1nfZBeXefWjz2OEpgn/HVPcYmsMu
 m63I4zk7qDyDPoQqnKg==
X-Proofpoint-GUID: x81-Li5GtLBNciJhThtAsgvgLzY0VFp9
X-Authority-Analysis: v=2.4 cv=W/M1lBWk c=1 sm=1 tr=0 ts=699727c0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lW1k0sWwHEZPp6lqD6UA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190138

On 1/21/26 2:26 PM, Biswapriyo Nath wrote:
> Add a node for the PRNG to enable hardware accelerated pseudo random
> number generation.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
