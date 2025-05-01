Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3091EF394
	for <phone-devel@vger.kernel.org>; Thu,  1 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087828; cv=none; b=LwCdkbtRDaDE3Fn7/t1aPlcEaP5JHE0SfGBdJbH7MnSde4uSxmq+hML4OoasCkS87DttVD2wekQwgzPv/cj4Y3ksmC3cBe7gEvZTUu9VXAVEAtFJnzqvwJQSQsJgLqk9QnZqUCrloCOrjNuXlVK6gFL0bD3avLOhMDkSGYmeF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087828; c=relaxed/simple;
	bh=i5qIUYMGnYjh3O5bD+pGUYppyjmm+gTXmK92O4h2v8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlHjxZnTM9be695DaxjmDTlucuXAwcZ7YD7Yjwnns4f14FUNHya9GfSSXXw9fbu0qwP4PPGc7eFHLWPSj9FuTFKQKvIhTOvDfJzDYkUY4b3jac1UKtiFVShzT4YlzG+qfgJl8rDYsaHlABGa2m8OwDP305WhI4iVctybcRbARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuEqgNET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuEqgNET"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5414fxY7016775
	for <phone-devel@vger.kernel.org>; Thu, 1 May 2025 08:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=; b=cuEqgNETSLOwnF+d
	ZFgIEOtfAFYyS4pTUChbA4F39BV2Gm/ODAl0V1wTqhUO8BQTnfzQn+9v8rqdC7Oz
	m6ht/j0Zj3/k9B1CDDciVcxTl8lVl0444rYLdRuRmrDyEglgVqjwJqut/36mtZE7
	V5SvB6sPwD07anEYlLdcDXPlFovNxs1w7gJrTtfDxRHXvQF7xXXXBrOUSBJfaShJ
	Q3FIl6xbxyBcu7gIh9xIHQqn21FSZfdpMcV5nk61SVbJPiQtBHttNIKPphrBUkEC
	m751KYZjnn6uqc5U/7/AzCa7o9ZdEM1jNe5JM4PlmaYY83IHgY8vtel7q28vYtwa
	T2io0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubmth9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 01 May 2025 08:23:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso13030685a.3
        for <phone-devel@vger.kernel.org>; Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087819; x=1746692619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=;
        b=gLEBituZZvI2CNSvSENJnckB4wPH6LpdBAQdG4aUquS1tUyxKWQ8XH5nPckcM8NDCR
         Hm13zHIcq3goiwyWk9+a2+CyvlgQcemwXmoLv4j3baS2k9JSHzG1IIURtxkEeGb/HErI
         DEZSKA25X/BnRERqHP1SOEYJesgu7W6VkneeoRq8HU0WCdCQiWfyplllWiMyOgk+gFbp
         oRzPyElm6WcAlupoEyGMhMhCilfFO9ewKlU67S1zxRiTDYnzIQroX1Caw65JBYTIqcYI
         OQ/QydqBCWLALxerL6n9yo/sQXvc/yXHY3vwnw0n4EoLa3HSwqVTb50Zn/JoIHmKR/Tf
         bplw==
X-Forwarded-Encrypted: i=1; AJvYcCWJTPnDhzvXupLmrGTC7j3z1EYjoUUDj1zM2e12JrHrMt4oNL+xGEkl4OAcMTQygYC6Y9vWvG5uyiYyzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNTyGfNXgdafzpXPd3owy3C2rtwpw5mq36XYq/aiIWJ0ZvphJ
	W0vUGUse2IMeDoiO0XDjl6ME4mY06HqgX/I4O6k/CLqw2AOXSCAXUTym8puT+sV2MduMU+PPcwz
	GrA0jJqJcIKM+RPbHa4Ld0B+9H13gct3UY6TIPKnHzu3Gimp27D1oUA8HOQp4Vg==
X-Gm-Gg: ASbGncuFQj0pHr90BG1+12FWCz/2ztyILIkoHt9Qyh62Od31Dje+INqK/bDSsZXiJTO
	GnwJilpdbywHGiEl/GJ/rGEq6rtChbeMZ0fusy35cwjXAA12I/v7H2VM+vi1pWVplnXxfqVgdSb
	CjaMD+nWuhtgfJnPI/sEu+VnXLqsXV/Z3f25hZkDpzMknBk/Bx3uItUk69SUFnBHk7+7oJLY2m8
	WUYMbIr66eDDvFbFHhdiIZVC0yQBHAIaNJ2KPVMHoC37a6zWZxvCHt8hQzm2mCGuvYTRq8NP/10
	WLqdgbSd+QMClaqXR8PmPWfozb+G4hc+CUZnbrHtEumDqaKnMisRpcHkMARafEaRr+Y=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162399585a.4.1746087819108;
        Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJbzEzGsqZkwSu1kNt92eSKw+iLzFuEHzTdaaxapBQpXXrMYs7ZN0NxD9KdvXg5kB1l+jX5A==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162398085a.4.1746087818757;
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af93sm7624966b.146.2025.05.01.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Message-ID: <a9f893cf-bb92-4acc-8d9f-5a3180b67d75@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:23:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L4_xmfBLM_5Xm6k3CROrdNhAHWG8_fk6
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68132f8b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfXxRb1jwww48d+ lryKwHmLnV0SHY4lT+x4iDHXyxPErVCu3SMChfnC3hXpW+y0Phm/KlUBwRkHe5qtrExWDe/Q9Qb iWFGztitbIvVyEgi2i/b+cT40tIPU8GHYczTnf4CQswA+JWkN3RxnlRCKMgH2XWVP/W9ZI6uRpg
 Z+6LcaYBEf13FcYwvmtzQEvMCyvuTlEeLI28ItMcGN8eHgmJG+Acstti5IOE8xCJXQufWIFYqd5 EJ20QP/wibOK0wFYfiBFTlIy9MGk38JbbriQ6NTcY0GmcEvZZaqjoLdju9Dj7iraL6eSy/r5P+b 8s9iKXM6FdeCRcoAoMq0vyepRQI3i0gvXPy7Wrw44WAPerrZk862a+sy8QuY1j2Cwbenccpcn9K
 PWkYqCWmHJ6da72ofIMy8aWuE/swtRIKyhoDet/5Vak2mSqEoESBoPMf4/ZrCsivlPpKTV5J
X-Proofpoint-ORIG-GUID: L4_xmfBLM_5Xm6k3CROrdNhAHWG8_fk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=983
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
