Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168951D5CDE
	for <phone-devel@vger.kernel.org>; Tue,  7 Oct 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831415; cv=none; b=ZY5EbNDxTQofHCYBRI8RkuteP3O0MexrbJhoqca4uZyhbC5lHQ7FvF09WvwANI6oJF8fsmX+eObYUKwW0LRx5KqPqLevKeqVGosYLYt+BdXkslivgSbAU+Z7HLVB0Id+O0loLjdiHZ69gbc/LBbfVu43rZRjLZPgPwKYPz0GqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831415; c=relaxed/simple;
	bh=L8Q2C5/Ub2uJq/QGtFgBbZf6xb9DzU4bjBeSblXm4p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8VrG77xqIfgj2qJfQcaY3WXeN+67KMFmosmMdJuSygeMiQCNHbwV0B7goush11E/SVi3D03xal32K4Eki7Xm31nrfZgoq6mDuwGjI+qvq+4BA74EJOgXUjrWtR+3BMRxBA2wVkf3UsGqUmQCGxdvchLTE5MAb25kKHSfQGM6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psgWcGo7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psgWcGo7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972q2v8027377
	for <phone-devel@vger.kernel.org>; Tue, 7 Oct 2025 10:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=; b=psgWcGo79wVpASXP
	74n0WlpHkbJBz84+WKHWz+uGBu2O8olBlalaS/p1XxgI1WmGdocD7He953nWCP0P
	HvCg0dTv1+W8S19QZ4cq1KO01D2R1kUAYkbHm4RryWf1emoXLBfIXcnITM9zuxtb
	Vb4fDKbKJ+JbK/1hhyLryTh0BljHq7xdtVUTSt6m8KYqhamzLTkmElvSYJvIp4qp
	0tsmnPKELwAZdU7KfBDH+JBaqbXiYk6knrY9qhVClmMBV9a4MXpo8kw5Eeb+WMHj
	uF19CZ4oCJJrZceg4uGmo5dDfak8Pbi+SKObWq+mNA+o84jy0nlHjQ6ErUj76DbW
	shIkBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn7549-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 10:03:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d880ce17bbso6191611cf.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 03:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831412; x=1760436212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=;
        b=qN2YSBGXkj7sJVYDZiqhmEvAHz5llOx6md3upwZwPzZZSvdcDmZocFc+aJa+MsGUOa
         qRvhH+Wtr1nIR/8+wIxN3DJKHRFocrl6ZFlOv03SJYzuhibx6jN6zPxXyev/uyG3VT4q
         M7QIfzxebs2qqcEu2P7dU93AzPIyoFOzjWyEZL6B26NYxDAFLpx6Hzpu6kWc1Ozw5rxV
         5Ym7ofCV/p2czk9wnqNrPp24mrRbYeW/hW2kHkcZ3yoLhIYXCeAH1CWt3j0cdxuqtlon
         T8X0dbyBysqGWpPwGQ6UZ+1cJkWfT/uiAcjHnOcUWpY1Sr/4PzRmdgcwb/c9wLd2R8T5
         6icw==
X-Forwarded-Encrypted: i=1; AJvYcCU9s9TGB8azeoKot/tHnvUDCyM4I04wVViUiVtqLMffExvcjKwtjvYIAq0asUdOUFOKO2F4IjHTvdtyPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUZGots4xDE3adfToeu3OO12eAxYZxAQwbM7jTIad1Y3W168p
	2uoxQgZBtLYhTWwBYJpFoPixHdwUS4sAmHcdNjU4/+HeA8G0ZGOuL9lXGRf6I79KSYA3lGXw33j
	ir8XAuDpXoe7KTB+IJZG8+PpIif3iq38jJ7wPo0oXwAIIePjiWxHsDnqbR0zAmxbszg==
X-Gm-Gg: ASbGncvVQInvTK2F2aFuZaGu30SACOXmwww6p1v20uc7W8g+B3Mun628ySfJvsLO6sa
	lIKIynSqeIeNBhafwr1J5Pt8gaG23PAUWD6/0APk/YQKoDaWTU2I+7k3om/vJHwqa7Cpa4J5KvQ
	J3LZcD80GV4Dl2xYMDiLUcSum/a+IGu1s7PxMixxWDsW2IXBfYUyDdIUIzBYcoIgGZKhqPQeNbI
	AgVYB+MpKbl9Z8XWlCczEh0CLjkXIBeAuZFbMBMKeptr/RhSslVIbENO75mQ5EjTRuhwnpF/7wM
	JrGw5u+9RJBd0C11ecW1EUAeRprgI/wjDP4F77ZK6f4vQocP7YpUiA71CLumaCRXzsWcCXllu2m
	JH5cAyiByZiASWntUDYCRSWFNo8E=
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr120455891cf.11.1759831412043;
        Tue, 07 Oct 2025 03:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH595GqzjdhPhPl+ER5dVZJGuod+xlkaWX0Q5/bGA/gl6UrOFg8YE+AYMFgUODCYAkuO8cjhA==
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr120455621cf.11.1759831411403;
        Tue, 07 Oct 2025 03:03:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4c1f6sm1383798466b.78.2025.10.07.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:03:30 -0700 (PDT)
Message-ID: <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:03:29 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX6JyyfWXvMSyt
 pMR3EKLK5BJ/JishCwglCFD1iyLzTwW4pNTSdaGH4T1ibwfFgwlOdd/JhqNlbaKGf0GjZ3LQE7K
 a6LY9uK+rG0PKpODeHBWR5+IRLAOhrZ+PF9ZokdE0XvBR+YhvnWLKkxbLEIzhxp/zLpyBrn0IQH
 DyqAxOxNry/tTmKcVBT3NOAxBUBNMfznrNNumr2zJDvR2sNpwrB6Y0EBHx6ierXkhdtUdPh8EQE
 Q9RHv+iD87ZoDduaCk4qONBCmeB2rzfDKKmBts6EVr658ahlI6/ltfPXWfnt8lWNfux+4c/0mfa
 eCPFlody2zXAizuqmILY1G2PavPA6F5lm0yBkxZat99SNIex80Grp4P9YkX3G5OXmr2alvtvm0+
 HsqUrelFc6CQDwKBuF3i9uOtQdnFuw==
X-Proofpoint-GUID: iSYlXPRccnOivE9umOsmjcfk8LUMA2Xi
X-Proofpoint-ORIG-GUID: iSYlXPRccnOivE9umOsmjcfk8LUMA2Xi
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4e575 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=e3cHK1UYxX7VBDkIoy0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fyZPtLC9JlAwSkJ5-iUD:22
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
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one amber and one green.

Do they form a single notification led, or are they supposed
to act separately?

Konrad

