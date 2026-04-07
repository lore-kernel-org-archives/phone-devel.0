Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9715239B4AB
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554543; cv=none; b=EkcPqi7nxOZyNb4f1JNdk4cctRQkB+GPs8fNqYIsN2Ymirg0+0lLwjsYv3E2q1HorvZz7OnURYSy3TKFzeymoI0q1aZ5wzd/hxpT+42qdjrhRg5b0Y187RJoxu4qEmSI7OLrsu0nraejj+gyJupuI1wR5vuhe8Y7ze4vbekn5Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554543; c=relaxed/simple;
	bh=MwPyQOiSQ6RdUeIETXwp4mpKmHfQUMEjHUb4gqtjrKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2Hptl0CAuoTGlODcZM8HcXZ/aeyJRatupgEiIVnCHbA7EFCFj8Wpc+6l2DgzMZB+aGYMLyvP7r5SrORqav6VmBb3Uvigu3FCLezzA0uUli86N3OSf0ckKDuQISTfYXmbfkKO2IM0hgBTZJIOAe2vVKp+g87H9+2spwJgaPi8rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzepB7am; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj1+CMts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzepB7am";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj1+CMts"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376VvZj3815781
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 09:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=; b=RzepB7amkneQ4mjW
	n/kBSwAwbeYO7us94i62DaMBfxEnQxK5hvTc84zycMW29DKt0PJoK6I7EEwm1e7o
	62G1hmwSs2O7XtdoKM5mmSABd/7kEGkqiL3XkCpir4eVow2JwLeCiyW38YRdc2aw
	2gLiDBSNnrM1UGS3PgM1CadkOWVY5OVvV6tb9CUSb8sUFYgeRnmRTSH58PhmylHe
	IXo+Zzu/acsprtXbOlCCRlCqc67BPeUe5ytuFOOAg8ahlJcUc3X+lZfm5cPk14SP
	EMLdi3dBTQb0dcZ02kdufIyJ72RQD92spN4WqFYvPOjUdYW+iMqqBXjNVWKqUKNL
	Wlq6Pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4t35j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 09:35:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d1d81dad37so174002285a.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554541; x=1776159341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=Lj1+CMtsPfVEjDCfYdBeA9uEyulZqZziVDZUuF1Ks2Eeq9SnFTuaC3DYy/zVBDkWnJ
         GxQdQzFI5Zy0zVQOMv5ZBi0q+fXrE9ZdHr7rJlCyIxhUL1lpKH1Co3JKdu/odqECQI9d
         WBmJeHO8zhb7fzcSIqvJov0LpkD0/3qktb2gFMFl3WOcM/1sRFgoraj3BKOESxnO4SHn
         WZw2KZF/sn8DxtluTa/DyhDR3UR7jwaIRu1zQUSWhbRd01bLGypXBaBaHT8LN9/nCa4z
         5171DMW9l/h9oL2S3YYRuPI/rkzmKYgFGJAlBCk4vbOsm7UxQiaKwGThpFhmiwhoroTp
         WsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554541; x=1776159341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=Nla2Bw8xw8u1CJWrNJPK5117CV6YdHsTO9JuZlyJQF0QZkwq1HCYM7n1+YsrpzoVBl
         gHk0NW4o+JnAaOET9ChQTs0AqRQlvTxw5e5Iou3D0U97rdTfsa+JWalBP5eUW5g/1cHM
         pSILKRD+PE4uNWU/Sh7lci79fjT71jPhVW1v672WAn7B45RXb86SQQ2pl9xtggkHWEBE
         IlekEqJKzdfAbuhX6LZn7ASUAeLhDGTLN9j6iHK3GqXrW8dOtfj/x64j+WBXbU+J9UBw
         hmeznX6OTL1O8Yescn9GQHigb5gH57ynB+52lHhIVSAkGdWJ6kOpWymFwDceuWNrG7ho
         YRHA==
X-Forwarded-Encrypted: i=1; AJvYcCVXHcLMZnZ7YnHRhrGph51FQaoQaWoVkEIKZhE6LoRBZZi2ITCPkE8Ue/5YlZH27Gf+zyISaniNjXkGiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyY2eTergWz+kMjPKRCq5wJ/jpdJVVGsqmYJly04BAWELbjamX
	AkNqM7nI1ugh0YwdVWSihZZ6LVCFlrV6s3DhnuKNvZO0IiZZGLxOv5+T29QVygTpk1VwKp57udE
	I/X2nCV3YkjDrw5d7Dla/AjzOibOr43Lnx0yGEE3dPoXxhipMB0PA1Bv1Vus33oqlbg==
X-Gm-Gg: AeBDieuQ4GSMp95Z9u9103nm9EqI3Djq8rScewDFndSknzlDGuvGkvfaCwcU6705aKn
	FaIW1EIri0A8u0Ltok7Uv70ilc5dNexzBzu95Kp/t88HF/jxhg0FB71YJ6OgjbvlEGrHOXLkcrg
	Ncva/S6T6Tp4Fsylyx69BZ8UL6i1i8oh/y3TTyYOj7jbWL5vDXzsxt5YIvh2QPP6Z/ZBP9i+pat
	/6jaGx8PyO6E+1LTq4JO6P3tO8JrYY/amp0gDgiaudmFJTcKdAGisnM5qT0EBqcOng/3OyNkVxQ
	ZTBvoX7nuMXMp7HmVSXsLPgTQUxyHNRtdUpCztSRssmW9V/SHIRHpiQVsFEso9GtCkJGpTh2Bd7
	XcXcHcqE59PUiMT/01tUuzFMlQKCWVbIdMVUCVC6eP9tYxzDewRi34pQe0AlIF/4MH16Uvfz67j
	ylB4o=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451761cf.7.1775554541024;
        Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451421cf.7.1775554540574;
        Tue, 07 Apr 2026 02:35:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a780esm4156402a12.19.2026.04.07.02.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:35:38 -0700 (PDT)
Message-ID: <14c61b77-d790-4e75-be79-caf8b7ee8e4f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:35:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4cfed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rDrCEZzy5hQS5nTwK98A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: un0wSYssDntmCyDb1N9_E-X5v7vWrzsm
X-Proofpoint-ORIG-GUID: un0wSYssDntmCyDb1N9_E-X5v7vWrzsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OCBTYWx0ZWRfXxolizmzIS6PP
 dI2Pd5xpu1xsiC3KwaMv94bONfI1ULpcQIop+iI6gH3GnG2cbefajXsyDPVEQRyON3TMmRR5tjL
 mc23Wr9VeZ/CjXCfHiD6fxCULvruu4zdvLNRWRrz7axt3huwWCWGIrVZRK9QOZcp2XObI6iFgQE
 1JJk3G9beOYB7em4j2t8+iXal7Vao/KCUVaGC+0VveD5Cl7UWbR5lAQrjm5kzMULMlYXwj+pm7p
 YoT47iHaoKxyWcPHBTdGau2YoexHpfN/nUVHvKNTZQ4C+xkDTciPnHOr0lsBZra7EL6XEEc7Q5t
 SxCdv3TCr7KoUUAkr1YJNKGyKU3jrMT8JaW9K5EswQTZqgndEXPPIMAf9800u2ihGojpMKTBeCC
 tfNeiqk4nHjeAp1nAq/+WjA7tOtraAY3qPb66HyBHWtb97MeQVpR/DOJ4bKx5zh4MMSkcL/Dl+m
 8bDVcvau7dLWAkg8FqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070088

On 4/3/26 3:52 PM, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
