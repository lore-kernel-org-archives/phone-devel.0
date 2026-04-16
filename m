Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D139EF0A
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334941; cv=none; b=IgkLDW156nCq33nb2F5r7kfvQZNS8qusSHF7SqcDXxRZCucXBIBpj1gxpkNmGhcukvJuHeyGUyo0bpzhm1H56xO6qsNYkZarvWlo8jkGesimPE/vmYdVlWJNl/MdiyiBFGSV9pRjFsbmfWFj2oObqKUM+LVAs7xnlXvRqV0ko8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334941; c=relaxed/simple;
	bh=iCB7897HV/XIy0aWQaoLcOKCxNFHQxcW6skNabD13Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeyaRWvqOX00UxP//Onhyvtj3iopiwcG6uuJ+6+ZEap1HCE46YKws3vA+vxhudHixGqf+Uv7qfEIE0Aeoy0VlVNB47pZG0CpYR6ORyWcbBTwvXoFPzufCIhkRK5SeqDO/trXjcl9OL3uiAnRW3ReZ9kXN5Ed+l/xBQL/KDMe4L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdMP/48b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqj/1ttn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdMP/48b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqj/1ttn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Vamm3089092
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=; b=WdMP/48bQKMP2x+8
	8eUedH25TxjVsykzU98QoP1WGR4sxeIZynkQwNvv2MLOCPD3Y7IaVPAAzh/wV7/X
	TvL2fIlnGua/QeSvrTjJem8vimNEPSZQPShCKx95PQ6PcOiZifvYbjmmVq0ca+1+
	K7bwzFL448J7Ln/0wMkOQCSUD645ZHH4x1prgXTs/SI5XYLaOmbTrx7xnr8ukQqz
	ZiumqK5wPsBEGAa6rft0P2jcr6rfGWiHLP+BjWOveJayWTHTi71lD3kuuk6ww5EG
	yyIqeGaAjgzmjRnEKWNdAUg+FdPyg9WY7d1bSa30NnIKkBNxqQDT40yfss13gdy1
	916yxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djp6a9qh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50dec198720so14686711cf.2
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334938; x=1776939738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=Oqj/1ttnvOazDZJjYPf3H9WXF5vA4QSCxaXRXhyWMVcAhyAmiHzhCmSlqCIW6sT9m0
         JVHRl+bX8Qa7ubBbCBofSffZTAgbzbyRjEvyz71W/PDPOSo3QH9DjbJK8ht3wYFFAWcP
         ZETi7M9ZuBX4nKmA04M5N3336f2/uP5HT58SiK054bt0oOomtUrisVaxlFWAKvCDGmwi
         EnpIKsYPUpdlJm8c5Zp5CKTwHgs6saanzgCeguzJc5BYw2+kFuUNy7yU7hqZiDXer9hQ
         E2+XN4UDEjSZNYrXa9A6UGhZhYJeGKBvqIl96wVxGZMOWXFhzrrZwtunO9X7sKzqQwnw
         H7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334938; x=1776939738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=mN0GTVa1N1KCgqOsrej5tzXFfKN4vGP5QdO893SC2FRLV2RwwV4H+aJuE1aVCYDtGh
         Fo2d4Gr7xfk/cugy3YUluhkXQpcrQr31ztiui29K++ST3J36lIY1tL0MlpBND5U5Fk9S
         e6o1mJH2omzOaG5PDTrP9W3GJRv0ghl7+lyDgaGe/lg423m+IM3IvBvXcs7atgb1qUnA
         L6//CghIMu1vTnj/Cid0sszgjI8G3ZmP9MD+JpgXRoqArdLGRZzRsgoqylKlSWY0AKgx
         6YhrUOL2Utn1d13nfhG5MVk1NtPv0r7ViDNaWVmVRVrEPePbwpIQlOLVhzXkZNYEJu2t
         uULQ==
X-Forwarded-Encrypted: i=1; AFNElJ8//vruCpggaXvhe4EEKbZCfe1PtmdzauMHg8Jh8+HCjX2yuLHBCWQQqBpkUxWb75CX2a5G4t23xm3U9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCUXnqgyxBTrxKbqwRe91n3sGS3gQldSNivXTCBpp7ESDweMHe
	yF+AKNm4Rvp3sLNXCCwhbcWTAat3FWPqLnzMLLDv1Htii6oO4kMjhuaGf4j4DcC1lcdANaFPfFY
	dC2RYRlMdGKZSEKYAl26BlMeZx7H6G3pTr7Z+xU0oT2ul/m/kBIP8MdB1qIUYYNEnKg==
X-Gm-Gg: AeBDietIkGOZEiMYGUnJ2Gl7pv9YBw7DcSWmJT4UGWxoFMZ5dFOzurIUpcSHXVF7RBZ
	S91SICibGU2S7f2DuNBigaPCAoA5excKCdPYVKdSIvtfZDrRN3cbw+SkBK5FElIGP7m5QFSB8ha
	8/Ut6416LrBaHX+Ag4KqbamvFOScvnYGfKYigREYuV1ZVXfjJdAbaS2d4TjLWmNupyx2J2m5eVf
	1sV4CBo6QLdP0GxjJYcrPZ+bd4mILN5VRmVzosbbDzyhFzAytayh2iC1H3P8rjpI4BFJHbfNWzw
	iVJosG2Y8ttkKFw5k0TqLegHKmFtn2WMC/vsSiftxOX+rksgg+MNlqDFexejcHV6EW933MHhUlM
	L9mD8JL5EK7euGMwE99cv8zx8gD5S6saZ6yGJ4dmECVha4/npwQV+LNGO3SwF/SIb7DSY8VWHsv
	601vY3x6+kAQhfnA==
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15688151cf.2.1776334938494;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15687971cf.2.1776334938080;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24865492asm96293566b.24.2026.04.16.03.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:22:17 -0700 (PDT)
Message-ID: <eaee286a-9bff-40ce-b9cd-5f8923736087@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:22:14 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m7QH_rG2VZARXUDc-jlRYZDX6gdVMwq4
X-Authority-Analysis: v=2.4 cv=NuvhtcdJ c=1 sm=1 tr=0 ts=69e0b85b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: m7QH_rG2VZARXUDc-jlRYZDX6gdVMwq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX9bIjTlYk/DIi
 UfCfIJwwqSA/t6Hqe7LxjQFdj3Sxr10QHLMNaMRfQCm2W7cklmW0hYE7cV8xI6ZgzSw1xEIutjH
 eZo6M0FRASvSVu+cYu2cTUQGA8d/2hVtUDnB1XaOtQk5+JMzUCLV5WHtYd3qOOclUWvowbmN7Ky
 xXne4oPhwN+IcO29Zx51XzH7r3DJ93JqZjc28i/nXuL3O3IGhgLWzFPs4UNqJ19IS+VQ/Eq9Pvn
 4p/jv7zXhLGWcH48Xg5GwABCkHYue4/jVQSTQzgenL3ln7vkzRseWt/vprWVOwLytlT0CjpNiYT
 inJsPblb0AFZmq0YD+u3DEyJoBWYAYONo1L/A9rZIctuomEY/I8EAwLQzH0n0JmqJi/j80UAXgi
 e+bi7ZOGC4eKpI/M5eMQxgl/nWdc1qUM+cVXY602x+VMwwxSnESub6gWv+ljZuzczdloJuRMl4p
 t1ZyCQZUKsaHYa5aH8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160097

On 1/16/26 2:17 PM, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
