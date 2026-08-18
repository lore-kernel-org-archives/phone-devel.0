Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64435B631
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045251; cv=none; b=Qfh2XhMbPCZ7p0QxTlr0zs80Vm7kPUHSf8SMacRSsa3oHKOO435hOZO7gvRgoNDikWhgKupOpl48dEESMjYaC1A+cXRdgXv1me4WowRxY5lR1/EI4QNlhyZuly/yD+dZbi7vqPaLRdH35/V+5kSUC9l+9di0lvbYts2Lrv2Lvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045251; c=relaxed/simple;
	bh=amz+vd1diC7SjsMF0CAr8AEkOtXBF3jHF9d71+xyfnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKGMGL942HvV0EcKy8pXHQrggj1EjDazMnUTRcJfYxklSZyofIwjNoOdDv+iYVfdYp844a23knXRNRB0fEIuZjrWs9My/4Yp8hDRayUAsUC+Fd8vWOvPufbHhHO/zeIRB04hyAOxz7ooEIURqJNiJvEpCZ2Tgu44Tc8o8nNzeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEupP9CI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzHTtoV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEupP9CI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzHTtoV1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BKhT310028
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQd6s7bdoRTyRzo99H5RBvALbnAO1zN/knQk47ZLTgw=; b=gEupP9CIT/Vr1ler
	9PZ78u6/C6hyZS9d99MFVrwSwy6fE/CRO5ykcV9q1QSPGkrsAdqS7qph0pk9qnnx
	y9I/nZQVM+iM98ycnLwzgMPN2qxSyAZzR/ZQ35t7R7XKss0mH5zHmnxJmtzUHpme
	yDpYry6amKhePX4znscR1+vbcZ3aZJI1nG9kxglLZbjo0YqbbGoCDsvDa4N5XlSm
	jIdEECJMezyIXxAUfjaJHciC0OtpObMzRKN5lKrcKTDVzKoAdg9/PgbMJaU6pS6d
	Kcrh8WC0l/vYy+AjJQqGsmmuz1HkmD4ldtblNvNRHHDHnD5yHIaTmPKTBo8gfrhC
	0iOVUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9fvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:27:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso42888985a.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045249; x=1787650049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQd6s7bdoRTyRzo99H5RBvALbnAO1zN/knQk47ZLTgw=;
        b=jzHTtoV1rVzTjkm57VoN8v8jTfdQMtuUZNbFmbmK2zML+J0E4RI2fL2zjnHzdMGmiv
         oGtIgXeArtQb7+YQkEmlwGMvAdsy4puc9JqML0iQktP5pGCKZJD2WEOL6wgj2cUC3Ixo
         6ZRoCSITW388WWVk3oVm/Rj+RH+oztt8tmPUcgcLaJoqh9D4iB1DaPlEs0vRgNA9OsQE
         fyYsiv2nJBwEA/1bZkUlGdjN5CC1/OjBmc0MiA1FBbAjKt7kPfpQaJ+x0lgHp9bARigC
         /GIoWD+h80PtOwydAkZTj2WXqPBrHgvAnnGBZ90HcjrR3JNfr38wEXTOz6JKfJ3qbutS
         XqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045249; x=1787650049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQd6s7bdoRTyRzo99H5RBvALbnAO1zN/knQk47ZLTgw=;
        b=OBppbghaDg2NRUEiSxd8AMlC8hnjeK+rqkmbUOezgUA9WeqGwradl9zWHF6S4M5BGE
         grvmSnDkSzZ13L5RjlOccLFVysJy0tBoyNzPpgOL7hUDnHej8u5JyF6iA6RM5fX/iisS
         ZICaqz2MmOgsScUYBVZKMNfSoVNRizsivuIH/hPdo3zFMA521mRDUOSoTIoFcRtbNLpg
         w1kpbXdhAxoCMFfJ2IAMEM+tR/YoDXl9HMUS/LbWaAxDa0S78NO75xOPZ9NsLg8QvEPy
         bMt6AjtfT17JFnY1grGG2SBEMxvTARnpL92D350Le6E2zJgkPqVqy6DEBLNlTfn9KvLR
         YSvw==
X-Forwarded-Encrypted: i=1; AHgh+Rovgv0krleALhxHZOufEL3xW1qpmladhpan7gWVFkchiHrvn6e4aCOdJunKNQGZMIRPwMrKCbUeFwukMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX1hCbz0ZKSXO2HlihlvlY7ZTIQdXdwKhbi6CKOXLC/UBKsY8Z
	36/K7mmZIA0T2Zr+i0kcC2gezWVqaAO16HcNCQpnqDmKsOKSYeQEFdxJBrcZAzew91HxbDhy0/M
	Cvu+jdtKd5f/FWNwb3notOND1cuowG5ZD6Vquar+3P+0d89QUPrzsAflIo9aBpYgZp9GGLjKR9Q
	==
X-Gm-Gg: AR+sD10qVcmvULqQjq08gLldKaxrniIRMt3+xsj7yU+sEDGKQEQLH1ucxJbHchfCMaq
	mVeUiemnd2+0q7xtJMP+QalLPXNsTaPWe16iEzuHAAGt1feR1ZpRkWJH5ZKKByXOE+HPW//UpAi
	2kZ0ORbaARThMe5EyLZXYRQkf05n4jrEyq1hRLmTBFEssFaIw+30ZYQglVBU9s6WNBqLJ16HDx3
	aLTHlG9jNcD9ww184i0PgLM4ETlUrnYqtQh8KvlJ0WxyZ+4JKJwWmMQx4BWvXhzu0K/QRJqL+1M
	VZQpTI2G4FB8BERIPZk8MCDyoZnzwsPzOZ0pcG1af/2Di3OOUZjwTVmXGiRmSdcO2apUlfY9aF1
	DXpnYiW7lyYN33vjN4+Co0Kaw
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr367647385a.3.1787045248740;
        Tue, 18 Aug 2026 02:27:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr367644885a.3.1787045248386;
        Tue, 18 Aug 2026 02:27:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73540sm127584066b.29.2026.08.18.02.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:27:27 -0700 (PDT)
Message-ID: <c4b2917e-c1e3-42c5-a947-ed906429730d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:27:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
 <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX2Wlg8XwtYFiH
 bFSYW1y0VX5V5MfBXT7kwYd9/Wm9bye6eX1YjmMy5vvQoP/aABAm3nG25IvL53WnsNbeRgDzN8R
 KVAZlXEeA9JDjuqSY+mscpJzeLyd3RE=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a842581 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NmR4qx3jlBvMWm_aBiAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pdPabH-j114KLEkG_Fq-gzN-qjLbGX9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX9xGxr+W+ljJO
 236No70vwXZWh3OGlv2kcg52ju8VDd2eKTVPvoiDl91p031rDh9s8UkZ2y8dPQeO9Pk3m8LxUIG
 c4fMab73/pd0YGd70JnubSnNq96//TXkaSNcNDPRJHE/+abEu4Z0wdPmi5mA/XYTux1TgfIUIkt
 OyA9Euqf8t9inXkAP2Tz01PVeMkbaei9+LReiNHN3l4oBdrvzgJkemnsDVtlINO4DW4b+a5HnMn
 EsKc5hUaw0a+HpxY7Nn8K4d5rXoD/ubrYO9LzjTfgeOOO3IJQcb/djI4DDtCnG+ANFkVjX8hQQW
 6gEkHrT1Z8oxxAtdj9vV5tFkoEs4f2FNtLzNdp/pZrsNa9STptPGTDWYkq6r5+9a3D20YTPD0ZT
 3Z2okyObUvUkwYnlKkSOjifEl7mjqe1HFqAA+kvh/KME8OBgwFx4usXts9zbqyAFD4scblIrBrO
 sCPjbhADaUwqbP+SJUQ==
X-Proofpoint-GUID: pdPabH-j114KLEkG_Fq-gzN-qjLbGX9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180069

On 8/9/26 6:48 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Initial submission for one member of the prime Xiaomi Mi 8 family.
> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.
> Known differences are battery capacity and fingerprint sensor placement.
> This submission includes basic abstraction for other developers to be
> able easily extend it to support other variants.

[...]

> +/ {
> +	chassis-type = "handset";
> +
> +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;

Is this necessary to boot?

Konrad
