Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876952580CA
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056982; cv=none; b=oF6YPyeSWq003KgQ98mWnxa6fwxhRw6KgcJ273G7vxBq05rbAtTV8ktuwba0vB2h4zyV20pz4fHcRCZCGeLcZf5Vv0lmuBZ2Lh1ii69Z5bLzAj3bZq+8qC4vwe4u6nsK5YAZc9ZrrVJ1GwPiTs5jObWyrcf7wn8nXmAbeU37E3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056982; c=relaxed/simple;
	bh=nItOCXaMTZikrEd/SG/gPX9uFOdLbGk1tBhDXjWOOog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siirXMiTHWQ0fqCKYREmJGNl/FyvfPDsf3cKHIOjTyiFxEp16boXp08qAhumJf/G7T5cR+Chd/Qy8y+eq5djyYQZEP8O11Kp68OKQRQSTPF0fnKVgeNAe1i4WUaXnEkpdFHXYcgNqK3lheU1xaTJz0vWNCatRV+GDb1Gd/sPVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egO7XlpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egO7XlpD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5716W97f012714
	for <phone-devel@vger.kernel.org>; Fri, 1 Aug 2025 14:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygnu3vKtE4DVMIUyobWs5dsEn3embXwZTU9fPdwC1w4=; b=egO7XlpDG/iZg2Pd
	ouw+Sd0Y5zRBUvnt27rkvfU8XyM6lTFdcypePMt7sLtPBPz7lY4q5vGZ0653Nrl9
	zFDCV0w09TNVGYGMtNND3D7/hKCpL4WgkBwe06VaKPVobsZSMHa0wjbbRAMsv7f1
	Zy3rrkQznQtBaMbWxLlP1LIT4ajP7F801kftJg8+cqVZrzkTypJk9lE39XXmHlig
	9QQ5KDul+1Y11dL/MyPwDYCf0R3I8aGRZbSxwC5a6o7MwKvwZx+oxQNoMZmEaTSR
	5Tcdh0bRpLfbIqfONpPah0N8+wj8kS1wjCSc9HI0iWQClnaQ5V1agVVJyAndZ7TL
	g+nFEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2uwjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 14:03:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33e133f42so62843485a.3
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 07:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056979; x=1754661779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygnu3vKtE4DVMIUyobWs5dsEn3embXwZTU9fPdwC1w4=;
        b=eiwy+205452Ku/mVuPHFpD6LZExFqFOmsKTmrp0r6TfM8GKcI/UsHqiCJkGvbb419T
         r7UvzGb2kvo4k9zD5v9dDixdXClFsb/mN3KNXl81KEAjGYP00WtKxumM5CyyTLUgDlp1
         YLu8UvaP5HU4MXDnIlcDkiHphlIf1jS0a6jyEpChZa+PZefDQhf5hktolRb9B2TCoKTu
         TVOdERqRc7cEWP/BYK23pqAoI5PjjvI4IAEBwlmeJmz78hM3/oms21SfCRCOITp9bjgd
         K8b/2WeBv4+JmdjQmXr6YZSdVjL4cyyLF6WplYXx6cuSgWjr3sQ8FqRSQIJbYubxQHwP
         iYYw==
X-Forwarded-Encrypted: i=1; AJvYcCW6bvdXpoQlrACe9ogFCgl3l1KncnIi+bHbDHxVlzOP20V3vJTpNo+qGJ7IDNm7BhLYgX4G1oCpAl83LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzynCQWuRgYQXHfL/mHD1KLAUMeTyQ+K5P5U3+ohBon6XoYMC8I
	FFXoYn5hqjzGIOGuOLTuGFkxXJ/mR/U7w1BkFPPhXRi4iT5CbntiV4ls0UpyK9J80ms4fHnLSav
	POoSmvTXMUcLgerB7fsV2DfagCvl/Eqyv+zBxEaodxeOqcb3JP8tVRrETaHJyjc6pbA==
X-Gm-Gg: ASbGncvxYes9+1El8/sjs2jA68ET0RcmGJ++FUuQusZTShkuFJ+iI8NJcw8q0R/l66R
	+J5Z4+AtAYsgkf8SQEE7ARbAIiL9WA5aI2qnAMCtG1P4DwV6hU1Yzmi+FrcBIo6oixfmJVtKAw6
	q4xqXNTOHx3lXu2iL56SHQOtyQwxWpHLWh3BHg4M5wr411/+1EZ/xjOL+aK5n2Uswhwxa3i+HY9
	gxf0KV53g3jokSwowujueUxb5BnzmQeIvCXl6dwkhckeuievZNR1KMN2TuwRN9RVaSo0xtc6/mG
	8a6aDHMkgLE0l9UnN4fI8/U0JwAGx79dAS7ynIOtdJN+R0/vF4Fy6FuoWodOeHdVh6o4/9qqbbW
	Q6JNtpDFeBVPkMYA1xA==
X-Received: by 2002:a05:622a:450:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4aedb9d4b86mr86440771cf.4.1754056979045;
        Fri, 01 Aug 2025 07:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcPlC48/d5ChZvKarK4CBxmt6g2Onl0ZKqiWKPbE3pGDFKjvLO3RnhPcMsdo5wR85JCYopFQ==
X-Received: by 2002:a05:622a:450:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4aedb9d4b86mr86440301cf.4.1754056978309;
        Fri, 01 Aug 2025 07:02:58 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2436b2sm283269666b.142.2025.08.01.07.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:02:57 -0700 (PDT)
Message-ID: <5696951a-d4cd-4b98-8190-a1126dca4317@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:02:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7280: Add q6usbdai node
To: Luca Weiss <luca.weiss@fairphone.com>, cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
 <20250801-fp5-usb-audio-offload-v1-1-240fc213d3d3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-1-240fc213d3d3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T9MRqSwKKwIYgTt1sW2y_7KmN9_xrBUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNiBTYWx0ZWRfX1KbX2Db2SFKl
 DY120AbZ/okYhHv/5cRN2RpAjFYW4TxEaMfhVViBZ4YiHhUJBEoe1ZN9O/Ct2HBdEeSarg+ko7S
 PjdC/LlEVM//8g28ns8vgQ1yMQh4NdBmHwUtPH6zVRfYxJz5V8TG1UCGN2eVCWUqblvTrLJei3t
 CxAG6uBXwKORztizaL3nq3bG9cMuPLHcwlRNml7BCOH4mYr8NHduRnxHrJCYF+JtRPUtT/AUKVU
 R0kmMSa7ZIC0OEdHuni3PSre5lI6SvUbrLMfOb2me7a5AkrzYbTFQsuNbzgtdozdtDYxuZjDGfS
 H2YWONJQOhoeQRseDmhBoiw+faXZ/T7Ap2YdfmVe+oSe+pD3HEn9vvdKw970j6Kucj6yShqq0r+
 9zApoidR4iwRFsoylPGFyRxMbaDCnTQAHadsRGyidkaLQ5HTYeETy4rIyiyaP1nV9/MpsB7q
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688cc914 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: T9MRqSwKKwIYgTt1sW2y_7KmN9_xrBUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010106

On 8/1/25 3:51 PM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
