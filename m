Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB783ACA52
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810353; cv=none; b=L24IgldmfnP98J6FmIyOrqwGhNsK0dQ1h7+LOhZY31ZNyGIofvhywYCHaOdCp+E7iv1kIZbGAbQsSKPSVbVGMP85S4O9jnCjGLw2hfZzMU6HNZNK2lKHTXrufwmjaGoX2BeHqWYWeHp1Wad8UTBGOZ5OlpnbrRwxtvYj/n4dCsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810353; c=relaxed/simple;
	bh=85bLsqNq6J8Yg43xXH2WwToGJpPw7K40P7+3iiOLLOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAgJi8YefFTJgNvXhyZqnreKjR2dvFEfzDNYfVMLlxQehsUmo9BFIh/jxSI5Pct8o7LMPxFsnJob2Vyvd6M4h4GKQ3n7zWhtdGkHbD75iMIkVvcqRqdTiZNSXpwzUlOfGyx2eBIy12XkXfFxqIKc5jeLO7m0GOuxlhuPSMypjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alWKGZxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuiETaJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alWKGZxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuiETaJL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oM5F4147982
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 08:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=; b=alWKGZxUkjf1lCfj
	4c2KmL5paUVQFq9vBJtjrqqgPLvbOUlkIOo/sUhTqBCZVM+akaim3jzU4SFqoy9l
	oQTlYiUlJH2t/XYN75hC5XNeJ7yXlqn6tMln/pN4iSjrvJzcp+vwDLzk4MrxWu3M
	8dp8mQdrgbiYbd7QzR1AS02EUalYPLAXrKjkU+HsiDxOIyx+yOrSI+K+pETJ2apc
	BOJfSAxsq2AQc+svh+Lqczl6T9NKOZQtjINU9hJmuNwyr0x0PF87pPK5QZxzqvLg
	ZcGdYdFVwbLOrPb83+0oE/93Qr5pAXg4c6gOWbgmCUja1nM6Yw+56H4PCQrvpu2x
	LDIMaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggjer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 08:39:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so5545406d6.0
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810350; x=1776415150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=;
        b=GuiETaJL77us/zrF0OHB2tHvrARnEaPoBlKq8xAxqFeIQqZvYU1RquJDCQOYDVSNB3
         ozP6a2TXMwyrmKVHeKW+yluYyTnl21wjrviR9kWS7Cp3ENSWGCLnsTQsOns/s2bdj+Ta
         as20NgC+4g3M/g4QKasJ121Jsgt2sB5HvktCkYH+PUv5C732x/i4OkDEwWrs1fvLSrQo
         rF61Ce5B+rv4Tr1iXKwG2A61DE4/I5SCRN9qoAP+5PJZDyPST832xWvfYSgbwDkdPxOa
         HSwzCJdgAy//PKed7DBgGLeRO4OniFdy3vcUs6Z2fRJJmhvkvRb30OJVvUJV5ricFwwO
         /+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810350; x=1776415150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=;
        b=iYynDXQ+GISNpbxGFanW6EfhUtjIZtkHQRlOEux3YG3D17OxqFl+ege63ekSq1pM3k
         Kg1EiWHqIe/Jr6yUnoxra58d0lpSI8gbGCFB8ATXtFLOH9GS1oHQgKw6hBM/sYUABrNj
         qNLs4KtqZ4ZVz44pq1FWMhEoF1oVSoH0/IUwercnUZvyfEacL3Jg06i9uaK8SQHBKJGP
         OvcgTWl27xcNGIf4F+OKK2PxN4UQTNRxNkgj1sp0k3+ixGnlzmoSe6h7ekDhdMRm/BD5
         nqsXc4QQvoQV3xuGlt/4SYIuOjxXRRRnsULI22iQJYUiREBKIhr+ouefnqGGpPfJ/iiH
         IJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSosUZxIoHvKni6IwocBnXwSKKyUUSS/298ynQr3NbN+2wpBaFlEuhVR8p0zHEm17EV98lvt5VXuJRSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSARjKPgC+0gdBP/qQynRM10BTDdshHYvC8Ix4rDV6n9QIMio
	HRZjJcTOFayBPAXQ+w3pzKh53gWub9a3Kl+P9dGCSir+yoy8M0BfYhH+S+Rep43hccvrNmKR2mB
	K/SL45g9mLSjviGu++XkRajIzXE332vu+9nAgEaHxPbbnnDG20wZ4u6GbMdEPJRqP+A==
X-Gm-Gg: AeBDievg3Oc3h8G675joLTqi5J5r3w8JL1ZXjAHiKU+ROLgiPtclNoLSsRiYtkbSQAI
	AEraE8gO07hBqdADRDQiH6NN+8ybfsDxfZJs6oWaFCWyJx6s+s27GN+WOKgc25bKtmb26GpC6wj
	pxX3wtsnXDSJYGKLQH1OAy3/ago8gbc4dmEAfJzaB0ZHrGWMH1iOFdErIlvSe3+0k/k3EQXtNzO
	LZx6nsCsvK66k/Pr5JEDZc153L4XK3lCyCZwtZvOCGmAQ5OsgOYe5zt9ULUzSTVUzRP5V4OMry8
	sVLy/sL9DToJo8RCuoG+L9CSdw1YnbrOeorJckeJAHNnoldZGFp6GnpuVrZwgPDIYtRfzB4jo5Q
	cYFyY+tBo5XKSMoBuJb8fp+K7GPeFBck/vvoy30EwR3kYAINrXDdsl3MbZUhd/Fyk2gcwUP6nGq
	zOHWI=
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr19901606d6.4.1775810349589;
        Fri, 10 Apr 2026 01:39:09 -0700 (PDT)
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr19901346d6.4.1775810349190;
        Fri, 10 Apr 2026 01:39:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1e87sm59575766b.61.2026.04.10.01.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:39:08 -0700 (PDT)
Message-ID: <235ebe94-2b28-46aa-a283-bf0647267723@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:39:06 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
 <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jI8KOa0sY9L1T9NZ9rkR_28kSCAqPipI
X-Proofpoint-GUID: jI8KOa0sY9L1T9NZ9rkR_28kSCAqPipI
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8b72e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX+br4xVSD54x6
 BqzmNbZ5LljO8pMoJBJbnQbdfB/CVGtjdlZvLb88H54o3QeJbcEJ2KQUA7Sa6jLFB8G0k50AQ9r
 nbcUnVQnLY/bEG9dWxmjRU9X5exi8VM3oWF8kpSCH5G8MsoMlrK6Sju5N2GLwlx26HtVLM+js3T
 MPOfvt6BnHwqadUNen1krwq5dia/8pggmmoPuwSfeXKvYpi9RN7OWcjbrkW6SWU+gqBiOMm3Bkw
 LaYCP1SzeSGEJnrYjAuR70eaU3B3CjTiJ6hudlYhSFFZ0hMM3Jz9ijj4nOGqaJSyew8KkZx7v9H
 E8/R5mz5aJxkKnd5lDcQLlfK0MI8EhAwLeu6mNa7R1lhbzDFCmnSefVYt32t64eYOhS+gshNVkt
 X1qWx626v2F6xIxB0QjhOyKI2WJRBy7dEly6g64zatKuKdtUdGUd0kBDUWq0WiSlCJNTKHdE0VZ
 0nFHGXQPW1jb7E7HHmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100079

On 4/10/26 10:17 AM, Luca Weiss wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
