Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8AC3A543A
	for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456423; cv=none; b=ZVUzzXaLHeo3cjkdKAtZRI2/ShoidqQPDEbQ0Ocf+tjNHa1hJMdQoWdBlWrTbrBuhMjvC0rknLGmQia9hlcFRFeksbiH3eMbl2ySXCq96eJqVShRcpPoMcX4TqMUyoGOOI87xsC1fxYmLe9pIsHXWxpcOrmIHskIk24CBdNmnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456423; c=relaxed/simple;
	bh=LmqK5rRmLSD7uS+kzV59AD9BkgWaK5uElWhr0Xw6qWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJx/YFlWT9gDmILW26Vjy7ia9p7Y6xXOnmD8cjZ/keOKqDnqnJS09zra5JZ5Ho/I+VsbtfDQrpmN4HLfrdLms2mopD3fLtOd/WIR9QmssN+PLAgK+YhOUiz7flO9UmM0uCEpEIvUpbG08Gm/M0CUMCaVsLjpRJnu2RQ72CRp1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRf48Q3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMFvWTni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRf48Q3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMFvWTni"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9J9Jf2765246
	for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=; b=QRf48Q3QxwtrM6kO
	A96X7cZMx2OOdjIMHEEMgzzfE5cT/fGVxYSmVDzcEy0WDzI6v6e5wEEOA2swkgs2
	lyL+WA+aq90Mo3+BIEt3WMlcbjWLCAnXFN41MzKmZbwgGSeONrzJrADDEpPiuI/A
	gXQgHJNjP+F7tLviU6cDBTBKJ75UJ5ZrKJf+xGxAUyQwGkynZsxoE9ByYVLG2+HL
	v8wzfobUxneJN3ZqzF/JMEu1O0xRjdG3km0zfOiaKLtVbYiOrSFW4lzGeiAUfwX6
	Uy4YyjC63Be+sQs8h8QTJCSNhIMRDROU0QKJB5nNPgc2z3wQfVcNppBDRJrkqeKl
	OwL8Qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7w4dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 13:27:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb0b93e90so20961771cf.3
        for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456420; x=1780061220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=;
        b=bMFvWTnik56f1dNOIq0NQZ6rU1dZQxr4GQ2Vh7L1A7Xupl+m2o7cotC3yPxmYyRJbc
         9rcAanqE6DP0oCrhtSFIWUDPUJiLAcCQq3hPGGtQSZQaogHtb0naCuPtTdomDz++3d+g
         lUpcfOaoqdnmcRqtMEeJECg9GzE60ub1fu4zW5S7Om4HvyNPoWi3ODoKkrKC3+D/slfX
         yG4ylJ8g5pBZNBO7UDNcQMKYPMl5p6y0G74QhOfW4uVU81Zq2NVF35Fwhh295g3iCGkI
         70bcihdQfdFQz5136+X9KJwEM0uY48eJI8BbF1Y+tNxeYTfh+QUHl36dSoBit6staHp6
         /yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456420; x=1780061220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Pz0vJzuHPGChHfpEbVvkt5ljihoZvt01yXew+4zY3Y=;
        b=WL256iMe1fgxX/Lq8O30PWGaybCynbhdGIjXxh/YPinNA0WxdyqqrrFf+7yZRe1Cdd
         LmaZVu1GJuV8Du5hNQ6TfDPgegDjY2zOL8me8BIES1edtGAnKV7lnHwkRmHhdirR8TRY
         JLAvrx6HZfiJ+aVjyG0vFfBRerJablfuJszpzLN5F0pJ+fucSmMDmyibSJUSXiQZgfp8
         eIkqG/e17fWnTC40wds93UXIeVgG1BAdBcgeoEZirooIlOCW90QT1s5tFBP3nJ/2fRwa
         mmZX+2IiFs2kIWO5ZzNEJKB97z7Nnr8ZKL2SGWgQFh4h+/teLl1tqoAD0LtZBKTXVJrx
         y5GA==
X-Forwarded-Encrypted: i=1; AFNElJ/86/esHgJ9aqHjRf7uulqpHWlhmBiDUStCCc9Pi7I121XT3vZ2f5O4JCjVb0DcrwY6pqKgNSSx8dPmJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRl9K7wFzuvMJ62iPkjAD9+T+I9txTzY/QAQPBn6V0kca17W6a
	yyj38F/QpopdQfoUGHL1eFTTojuFtSzA13SZ9f3MQr1Gwz3MhMrkcu1/srZA0IFUWC1M6NVSCub
	96aZNPgp5oQeufrxd4OhNZH9IOakoGU5/05xiaQIpaBsF3ITjqchhKkFlSfw3o1l7Yw==
X-Gm-Gg: Acq92OFEJtp7EdOBoB59IJoyHZAtq7zGd29dWUVlXk1zgimdVSLGMxVil01dgl5shDd
	Dh2pqHwF8OjB171uHVnR4iPj6iA5t0UVxnqXV2nvLMcc12WB9i/wFBQASsgcpD5qGIvvHAIA0M5
	7k6WyeD2LTzsXn2ajvisXttkQKfR+9yIWU2El6icP0YsXQb0N4CaibDv2DWlOzrgoWoO8vKg8IG
	EEWg9EBwqDIw0PeMzu8biIi0HDl+kfZtHCTUbcnRRRrOqqBxfdc28HtYxyXcpri5bn5AQcQII1X
	gt3rDcYRmMmch+2TDLzLqq0d+LjYViyMjCzBdFUkwmHPu/31fO9Emopt4vBkDTuztybUVfhbhXI
	CvOZ52tm8vcoQoiZWCUKxbkR2esMi+cp3L+oNLwLyerTCGQ==
X-Received: by 2002:ac8:590e:0:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-516d4390a03mr35297441cf.5.1779456420081;
        Fri, 22 May 2026 06:27:00 -0700 (PDT)
X-Received: by 2002:ac8:590e:0:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-516d4390a03mr35297081cf.5.1779456419493;
        Fri, 22 May 2026 06:26:59 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3050fcfsm54570666b.20.2026.05.22.06.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:26:58 -0700 (PDT)
Message-ID: <366ec7d0-76e2-4658-919e-da650273e9a7@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:26:56 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a1059a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wa8d-JAsDJw_VMoGAEIA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: W-ch0L2_ASJf5jepl-mX1Tcg87vCb3N7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNCBTYWx0ZWRfX+TCKT7869kD5
 YbWmS90rdw0ArzHAaYM6GiiLsEN1+YTYHRA7fRUro3VB1k6W1DtABYlGJeDpB3zlSwtrEaCVlz1
 BO8R07vAZVibGwMtQd2+aTieQG0SFE7w/p4REdNzPnQuY5gJq5wfmQ+enGIQO6OzmgdvsxZyP2/
 qPfpA7TNcS/P/c4pzRdtrDdy6vZfGKcwY1nRZaXPx7ZZTRFrGxx4XSYIk1lq152us6Uq8aba9Jv
 kiqxQfN+qDCem325NjTCgBDDBcxX+psJDy8e56OJGbIHhJnyUq+GsTbmmjLPIoOrUuQRyA98MSD
 e6DKPI3svKJc2vCywbgm8g41Nl2TjGiFf4A+6+eYXRdF6PWQb11TbhUWe1uH1rjDwKYbFyIqw7S
 UpOn3uZOjtXoAYM/zzslQwlkVQAb6ibyk0txwfmfcF92qcYgGxkeHOfDG/TriPIMQ6OOIPkzy8J
 38K/gbBnhSqUPOCSqJA==
X-Proofpoint-ORIG-GUID: W-ch0L2_ASJf5jepl-mX1Tcg87vCb3N7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220134

On 5/22/26 2:39 PM, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> RFC because the AW88261 patches aren't merged yet

Are you sure?

for the patch:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
