Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73363AF66E
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150474; cv=none; b=MrfGxYM8X/DhaWGt7/Q0entGXKi9WDLdfG0jBuYZLaERVensCXMOPXhmKudXOWOz9ltEGVYxZHAcd9JrSO5Qz3Imi6ivFR8Owdkz38x2qLYiKjVNQ64Euuy+Y8u05fUWjFVCGlI9gThAE+CR6KC7r+FJpvsO6U7E+aF/lTFJxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150474; c=relaxed/simple;
	bh=uP1Vm39mGXJ/9f4RTFIjWj5GN267Chxo03KGXfMZxLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y66EDFnbc7ES7DDFyOkRDJ70KJ7hz876hXvyNAdjKqIbBZFjE0E0lL3TOLTRnWbPkuBShUJDt6odXsBpBQ8EL9YeRCKKBBZAO+Ni8rxdh5IYs3q4FWvvPWz0jGaKnMmyptB4emBnKgzpiEOLK7AdaMrMaM3KpdCWNp7lybJe8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWaHMneY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJygEiMN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWaHMneY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJygEiMN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbWT0566975
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 14:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=; b=IWaHMneY/cxAQvPP
	wDJR4ArWk5uMeAvO/SffF+oCpqZeLZ01tE0GPKcSAUnCQlqIEUcoqu5baZ9l9yJI
	+TXz0q3MEgjaEXAekIHwZCDWU8wpX5A4aZGnL7IU3cOK1olAqZ7o4T1BsMkCKvoI
	3mIoNIf0AQye+MiuwV1TBw3TwKdwAlVZQHGvRKdRmM256HdZUXlhFgfEIN+p/foi
	Qb/wUDNFk6Ug7YO3ZxDoXAksQbWMTSaE4woKKQGuJ0OXREuwJTawOKFDUHuWQ8St
	DWl8G6LmDVuRrfQZbB2AV1ISC6JQ1W5isBnwqHEs4FddqQraHpdeEs+dQvmfbzmI
	mmKu/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa0c2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 14:41:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so3638901cf.1
        for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150472; x=1787755272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=;
        b=HJygEiMNayTuCeL1TQSOEZmQIzH79GdQdVFantqGXKQzaTdX1gyp0KaFarv3roNLTQ
         2EMJoc+cKaDzFVql4ZQUvGc4oGOkMwg5hz/yFrCe6Mu8erlCwHG0aUhmu9ZYlDqE2q6m
         iyz+3IBdwrDyUaUpOYpjDR6Pu0iLkrbBXmFfKRDADkdVwTKjR1h/4/oYZkZ8dK4GxcjK
         eNHKIRiHGAxio+fSKi2zFTPLrK52RW486TmeAuhdggqKpOdaOh2gMUyehsKdEEVH9ZR1
         g4g/OqQdE+1zrEQXYTr8v+h9qP56yhlwhAw3fX03DtboETZLgqaBD5IDHSJO0XTSYKUS
         ERnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150472; x=1787755272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=;
        b=fEHx2b4CQxz24dv8KwpqXvUvFK9BZS6gJrUIWncxRACZ7RkkjLtTJTgf3EjC8oj2lW
         Msyc5RWamQ/KKcx0/Fl9gVD2CVjiQH3CgLh5F2OBPrznl3X+wutqARUDLGcDyWloEjQw
         CBKZJ2mkJf0tgubEKAwG1MjR//8QUPC/FsWgkc+omQEtn7DI0ga3AjklJ/PiMPc3VzNB
         10/78WG3D8wDwR0nzClicBEQ878JWq9V3e1zwUgBvMDgX4aodqXcb4RHM+WSnqeL/qG/
         od6j1ky0oXMcnbKaPQAL0j1b55qzxBx3GVa6tcW9OOzjg8GJt/G/tywFoQHJg4hDgVQe
         +9lw==
X-Forwarded-Encrypted: i=1; AHgh+RqVu8p/DEGt+XpFk1OKYVsjwDSg2LsbfWt7xqY5buN0+019jfjmEkm/FDd84nJx0FSNg1OhK4Q5Wlpe/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyolBxFCxdIP0gb97qH+4U3t789iLtDJA9O6+1dloTBUkIvWQqN
	op3S99puICAaNVwoRhg6K1nAR5AXqGPCdZpaddn1e80wZzgp5Abj6mHplxaxiYq1LSBLrw3voyZ
	MOpMJYIeqxNqBTXf4/C8WALGBe4H4RV2FMJOWyQ86Sl8Y+i1bci2XJEwNtRm8P2R8iw==
X-Gm-Gg: AR+sD112khqP16LTmEvefJQsfi5ddeuM+aG0mKiHUdOCDWtTnkMMNEXaEfTT7S74B/k
	wAdCy9LWlQiGEC1joZufx2qA9Dtc78dvlaFjs+pbIkcsINS9CKJXFpRoowV7kMvsWnitISdRrNv
	/nL79JD23qDLPw8oBn7oPoUoVy5B1hRBqFwA0iBqkQyL1DACmglMJ+wpe5lYB8uqBY4JG/x/PA0
	gfvFq104SRL4ZPXMKazJYRLF5mI4X21aYT1B0o/rLdUIvN2NprqKQZpJNBH3mZXJxGng2CwLD2D
	sEh3AJe/MzA7KLcIOhLWzcyRt5tDvKqj4EMtVBqZ67RYFmkggs7IA/NCSdLUncc4fI+IrMfq0sz
	MCvr1FTrFrsUKjKCzMySFJZmt
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr36596081cf.3.1787150472056;
        Wed, 19 Aug 2026 07:41:12 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr36595551cf.3.1787150471535;
        Wed, 19 Aug 2026 07:41:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c244b6a5277sm18028766b.36.2026.08.19.07.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:41:10 -0700 (PDT)
Message-ID: <67a37c6e-ff13-406b-8897-1faac3ec9f27@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:41:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: Move touchscreen
 y-axis to the right place
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
 <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85c089 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3R9UXOM9zR6sg_fn3_IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: E0muw9OoycWuLGBPctk--mV3m2Bfht6n
X-Proofpoint-ORIG-GUID: E0muw9OoycWuLGBPctk--mV3m2Bfht6n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX/gt9rMn2CJhw
 Hjo8neEettB2CP0zF8BY9Ho0bn03QRAV0f1yb+BFDnhzEGIUEG+PLZkhaeZymuNCtvX83KyQG4r
 Pfaavov+L4MpU8XBP01fwCJJWnpI2cE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX4qu8njHp+DBI
 xUpueeb19YaCUhsWqBdC/9lMQm0SY99W0Xo91Q8XvIvYnTUTXKAbzAN+P13tTnb2sgWlSKGM7tc
 E6pyk6Ay4ATr9fyP1VGMP8FsYKGCseLDf0JSlUXqQKBqyZ0dMFUjyJjqF33jgojC35YaTEzSwbM
 QJVkQBnIAgEfYJqcwPvMDItpfKlGDIqBVdxcntzrJ7NIHclcRV94Tj1D6aJLDee8liq2Q13Ckht
 iyRdL2ARTkgZjG/HyRMw1pGMdDkZh3z40A6XQCYBXvzT7julU9YoSK3Yjzvx+CXW04EaG7uY7JS
 ZPDWag2Tm8PHJSKALwT3rsp4pIbozoB0DvIMDsHSr3IB5F/HyNbobRw2PH2i+TYSGCz+h/xXhPv
 HT5N+U9m/j1tBEc1/f5K/TqSZ+d0IGX+ZmOvxEMujGLoLcQN0CweaveFHZgpnxmUYVy+tPDYp/z
 +oBNSBoyACm/dnES1IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190114

On 8/19/26 3:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This value belongs only to enchilada, fajita sets it's own (as the width
> / y-axis differs).
> 
> No functional change.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
