Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE4A2FD1BF
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239901; cv=none; b=sbuANY6acjvaYxALSz1fvaSGsdHmpvYeL5vRH/A4uBn/1TR0yLC8Gns7/8BGYmCDE/3b0dPdPluzLhe5B4E2tYxhuQu84mRtJdDN6/GZyR2JTzk8Au+Pi0aKocpI/LwUErkSJAtjwQ0/oogjvS5o95/K+fmjvIBsvrtMyUAfTag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239901; c=relaxed/simple;
	bh=uFLzZ/OpOze42lfs9jzKcryGN6NcWAmvBOPQSyaCvIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No7R1CckU7+L4ehI9kGS80r2Ro3JlIunei8Xa0ZlWqZs2xNINptUcez0kFoTqLuaXNW6LCu7Zw6LRWFCwZdtFVtrfE0paBuNAnbTFtm4+1IphGvl3SpFoCM4al6UQjqDM5B5eraWaVoXFoISAXr8Sf68xoo2m0clKBGak0wVrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAg9yyJp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGijIqag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAg9yyJp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGijIqag"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAQ8Xx2654046
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLeGWuVUYOMsAivyCeX9pczLMdB6yClRRgLlfmsVrLs=; b=VAg9yyJpz0GtCpj4
	56SENzt5ZkKUkybm4QBzTYyX2C0zom5mYqe3Z2N1mccX87UznNB3RRg2OW+48H68
	pK+8qiVWNWp6QakFfrHbyI3xzHlRT51kgj2TRCiCv956eWnooEMQkU4cWZCYcJ1p
	IiByB5C8QIhuftgP1INSPW6x7oa1bLGXRN/QE6T7pzsQu4cWYVrXmvXXwKb0eXTJ
	zzoXCR9DzKLrmk9JyyGfGwejojGR0Ha3J/49uKBU+at1gaz7FDNGhB6CxxzOyo/r
	2tmWuHkDgpNl3NXC23D2GfDgVZZBn9VtZT+wyJri6DxCF2OfERafuOyPV5oK4EP+
	qn5ahg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1vce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:04:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946c23cf90so23035996d6.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 03:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239898; x=1771844698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLeGWuVUYOMsAivyCeX9pczLMdB6yClRRgLlfmsVrLs=;
        b=FGijIqagrca9mpjMWhXWqWXM4e9QDrEoyDX8MmBIiFXb0Z+tNKOhdhGW7PM///0Nkf
         AzhMI/7Tf2YsslWTcxPQM7mdwzFxcHUgf6+9vNRPSee0cAsAzEgNhZYAKY9DL9A6ow3S
         CiW0CrLP8kIWsLgaKHeIJa+JxGjEL0M9prXqvGwtoav4e7s38eTLmJzO46gRqnhGS/bU
         +KDgNXbNAUz7vy8i6Pzk+R47nW43c1eDX6H+UKb39b+0UGsI38VpnoB3+8Kn1FUOREB2
         7f4Z6rQir3+7YlW6uA/7pmj5YP5gS/6GnfQwQYPtE8PP77dWXPBSqoc2jY++wYOr9GTC
         pllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239898; x=1771844698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLeGWuVUYOMsAivyCeX9pczLMdB6yClRRgLlfmsVrLs=;
        b=C5lFx1KOQv01VnpTsuWmO8V0+oVTSbefEr2dZWojD+mA/rRoLukb1/+zbvpOFIHbgl
         SjL+W4qlj2alYL3g2pAxoEvAf0pKB2C9XSz4nCnpyfeaGzgAFXI/BaiitpLG8OzbwpTf
         nlu4nDKO1Y1rlWvZXubXZMI1b+kgFgG4aS8V33jGx5NZZByiIUmChHbdUnU72g6ZTIlj
         p6G+vttGnQ8FyygOscT3ykG6EcImjx/2llBr6J7y0DWeF6Asn2gXJOpbXQ6ejuHFynEz
         jLRavZCmWVeEfkXNmSWha10FHKuuZEhsDU4kyf0Ceym/2Pv8OZsZykMm7DF1I6MTxW6H
         PgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBrApt4gu8/32L/scrmkF0ODEhFS33yPH37SWpUKOWihrhH1G1vmmJDGJVNjLIJpFPA+zxQgjs+iVphw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNncgUuRKeyP2DUWGF78Cx3NJsu2NJ+BQlwJhaveTOqDJpMsyr
	x57JcXCYnuXAHqhZzoQLj5Zh75ayE+P/CfoJQomNv2EsDaXVUp/oQSmzwrSHy0VlMU184UXJ53z
	j5QMQ24Z0fsOtFrrIWh7hHu1yzNwI+RaWKYv8ChK4wHlIQNpkyqUjcNiRG7bvsRxMlQ==
X-Gm-Gg: AZuq6aJ761mY5Tn4UN+C70RVLVvIhj5+P/LZR3sW5ZwYYLUPx2aSOMlUMyRc54L53Cz
	m7J/wCzCeNLiO2zDL0kEzp7y1LwjKWMvoB3oyIy2qGgbyIg4H+3P15vls7XOcWqJk6ggvXBYvCC
	VyuacUIL6f/ZcEQqsZv7RuviN0qXIvJjL2dWhA16H7cZsvb0ZPFF929HAqsat2va3zPqGqpDNtf
	+B/wMjeeZ+2eAgRRiejRrY4MnMuL+SRCItMd8uXmi29+ZM0QPsjIfT/CV+PX9VrNtlCOh32ie7C
	9PqUZ1KdvY8tu6S7f17wm/2jnYNlasJPzxDZWZ9zR50d6V78fx8FKR8fkImVLTYke26GEVYQoFA
	zc5b443wmR57iFX/5Hdz8Wa9vzMYWjCuHyn/kOhpAXatwPoBmgHpwZeAg/BsQ0+VNQQqrzMR0Co
	+ryno=
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr98228146d6.8.1771239898054;
        Mon, 16 Feb 2026 03:04:58 -0800 (PST)
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr98227796d6.8.1771239897540;
        Mon, 16 Feb 2026 03:04:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b56sm255173966b.37.2026.02.16.03.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:04:57 -0800 (PST)
Message-ID: <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:04:53 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992f9db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=z6PqFfQUvjP8iauf7AUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: URnoo2MBycDiNNY09e_VOPkzCdzR07_p
X-Proofpoint-GUID: URnoo2MBycDiNNY09e_VOPkzCdzR07_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX9hk4URw/LcUp
 lpJ9+2V4tY2EvyIxOBqckbYmFq5mbpwwkx5Vt66YvKvJ5S3IWF6A4duCmTrs3DeUBFCFVHXs9ZU
 NSSN3tbxHA2cxDvYUPFiid/t+4whnBNjmSU/fj3mEDU96WsjIQlQCYvwQ0YUFqJ7qgctdmGkhKm
 9BHz0cMGTLSHBx+ST0Pp/fS2GhToaAosGOyIMduDr/S8sqEvZFGKN8tsmgTO7GP6nc3zzGdrYo+
 70+gPvCnHmoFvMg4is+NdmKjWyBA4Xq+CgchuQsOLNaafxuOaaFHTYQNOGivrh1CdlVpGmTF0/M
 73V4ecsCyJfGO2PaMhOhx6IkXlRhg/RuW2K7IT8A9mVOT1CMyggJLRTPJq12EFqcTn4R0VuFONx
 vpJMUIYrH0tORFIc50JIevx+QHaIEPKL4L81psJJVBaq0btOyf+ny+KUj92+zli0i/UVlRAsdzo
 QUTjaL6WYmfFQahVMqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093

On 2/13/26 2:15 PM, Luca Weiss wrote:
> Add bindings, driver and dts to support the Camera Subsystem on the
> SM6350 SoC.
> 
> These patches were tested on a Fairphone 4 smartphone with WIP sensor
> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
> far as I can tell.
> 
> Though when stopping the camera stream, the following clock warning
> appears in dmesg. But it does not interfere with any functionality,
> starting and stopping the stream works and debugcc is showing 426.4 MHz
> while the clock is on, and 'off' while it's off.
> 
> Any suggestion how to fix this, is appreciated.
> 
> [ 5738.590980] ------------[ cut here ]------------
> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'

FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
and keep checking the hw state)

+Taniya would BRANCH_VOTED be fitting for 6350 too? ^

Konrad
