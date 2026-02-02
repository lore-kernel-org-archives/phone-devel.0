Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83433A9CC
	for <phone-devel@vger.kernel.org>; Mon,  2 Feb 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026561; cv=none; b=XOOFJcFT1pZTtneesGWfwwzLVfcgCj6/v4sotIj5OGjaDtTHolCLLQSQsvCYGV1XTgyg91KE0TwzfpsyRK31tsQYWdAJogDR5+X3NId4czuDaTv8NQ4nSWSmUyBpAyVZdYooT+V6l/QrBxSq/iyOqT7k9XMH5j1i7lcw2qEp7mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026561; c=relaxed/simple;
	bh=qIB2Lpv7TxKGpGiudH5ik8lNzRLl39d+O4FnkJ1I/Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjr1SphedIm+gMx6aQTZaBjPBg/0Mg+B3eTUZ+9FvX4Y/s8VxkEsl8p1AlZ/0VbJcj94Ocj+id+sexNeliQrLI+CNjFbdyDMHlKmRVfhKc63uFZqymT/6zVaMnriK/jF7UjA6YMrBZdgo9uxE+TLs+xkaEQDCAj/FB+9rVyJqR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bC3AVQki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu0+c0Ok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bC3AVQki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu0+c0Ok"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612869jR1193497
	for <phone-devel@vger.kernel.org>; Mon, 2 Feb 2026 10:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3tkA7AYDqhBa/hYNHbDMd5f2
	xgn5W1OlVmL2DSrMQrI=; b=bC3AVQkiG1E6+VmbGlbkWeu4aNe1MpCPBBggMkNK
	xr+KFaazaqBZVd98V4/hyEOZEcthr0bawlLJCg7x84D1ECMg9iC3xLdG3msG51N/
	WmqBeXSbkqCFj2Ez9tqUuUOfdFMNIoe4HlNDCIqM70g0YmRfzRNVjJPHb/nX3hLK
	0W8nGv3QGWFNxYEt2K8toEOChsErdAWNaTCkJjg/iLrjOpHoJjC6ddxckLKIg+yL
	/SWgi+ZIbNg0bREe+d0LAcALEo45kKDdx3HmVGuw5b1c9MBhNpFUo8bIqAeERFHj
	+Y/nVuVNLwfznpunQV6sf6YlL+iJKDDrRmVN2IFxtQkKjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4w09q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Feb 2026 10:02:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so1081175085a.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Feb 2026 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026557; x=1770631357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3tkA7AYDqhBa/hYNHbDMd5f2xgn5W1OlVmL2DSrMQrI=;
        b=Gu0+c0Ok07gU8g5d3nzonGonhtjLWDoaOCw3gv0eBMPnM6znH7tsdvuh6PFx8UEH1o
         4HlXg+m77N4M0Db2jA1YQf9Z9lNtgOF3DH46vqk2C3mLQndxskhfuPha4W/veA5aF9uo
         bvA+uOchITa2t5+uWDWkWKpQqH7AyJbdAEsmq/dtzTITxZILTtifDjl9mF6dvwUFxmoT
         eIt0SzRTa9H/1BsE9nhANY6B1x9h3+tc5pzh0MjbwjiWakGcEu1nnZSOPxZOD9j5Hwb4
         OsPGxz29L1oNgBMIJ5h2vNSznrISmLfWWeu7EQuXpZCh2FHUSNrltOBYnpygJNX/EF3E
         T+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026557; x=1770631357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tkA7AYDqhBa/hYNHbDMd5f2xgn5W1OlVmL2DSrMQrI=;
        b=k94iguNBqMAIXExReaSnhGZTGv9oAc3+CIICSQrhTqXNM15GBL6zOEph7tnrDeIkHJ
         7NxUOsa23oVRCNiluD074QXgx7BJmoBDw0u+cQ1knDhuljV9uOVilCnCzpaCwVnDgQtP
         gPe2n+6On+rgMTjd2dMHzieTCMfPsjtY4B1KMuW/8SOzsIa+r+uxyxFD1Zy6XxK7qr/T
         6MX0qgkJZeCZvOV+KwOcmpGOYS/OT2l9ELjHwerkUmMgWFf6n8YLYnQa7JmbEuem4xlq
         L0r9G93j/Hu/jMpgPEU8G97qXRloPjjUVmzygmuieNmtCAw/Z27AykFSfUdfkq22zZpP
         O0/A==
X-Forwarded-Encrypted: i=1; AJvYcCUBP+V+9BsJllI0P15P3575mThAgX1uZrh/O570ItVOQr5RmPSOVYP5lb433txRF9zmDB4L6mB0XwJWng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3pe63sPiJtPAfm0r6BeRavj+986WkE8KSSgfJ9BtG/rs42IHa
	h8sg/e7otWQuFFLVMYf8YnXzLGfNAHoRjSSsKxtY6+OtOdbH84N0H66celWhRSrFdmEbR+/G5Lp
	7c2frnoPDGN9Vfg8jm/QA9yoGYwkh5I4fIHhnydl49UwudIhQcJbdUrNQuHFKl31w+w==
X-Gm-Gg: AZuq6aJ2FVU5DCbYWPoMpvbUY6CkKxf1HPocX2RTrorrzQVWk6SMVRDtLGd2luw78OQ
	pt31pin6f1MX4yMzHgwR5DW4zH1/W/8fjBd9P9LeJDKvr85AKNxnD8KReBvV1UUeJwypBpYRkN9
	SAO0ElonQfLylhQrln/+XNkO5EScjTp7Cm5MBuxQOt48uw6pw39RCYZgjbaCtEGGzQ5qBWHYgTA
	oc1zQetZjaIHQBuNgKDVMG6JH/OnVO0nvgJldH8Rv/kTnvTy9jIbp2ydwXvcQ/KbvwzCPCaeN43
	C9NaovBqMoIGAfJcz6ZniTjx75H8N3BeLqbxc/tlVHQjb3YavE7JReWBqTk+kU7wdPlknCZNLXF
	VxWH0A068lclwTrzlgVV9anKw
X-Received: by 2002:a05:620a:408d:b0:8c9:ea1c:f21e with SMTP id af79cd13be357-8c9eb21a77amr1378166685a.10.1770026556913;
        Mon, 02 Feb 2026 02:02:36 -0800 (PST)
X-Received: by 2002:a05:620a:408d:b0:8c9:ea1c:f21e with SMTP id af79cd13be357-8c9eb21a77amr1378161485a.10.1770026556388;
        Mon, 02 Feb 2026 02:02:36 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3bf18sm91797275e9.19.2026.02.02.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
Date: Mon, 2 Feb 2026 12:02:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Message-ID: <eorqoqkpz5veb4qgq5o6ll6zhocn7tedfxji3le2ex257v5n33@pou5m7evdl5n>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-6-d3ce4f61f030@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-milos-ufs-v2-6-d3ce4f61f030@fairphone.com>
X-Proofpoint-ORIG-GUID: X0vsi1AQYybJ3kYLGJRlcJ8zKRbMF-5d
X-Proofpoint-GUID: X0vsi1AQYybJ3kYLGJRlcJ8zKRbMF-5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXzLxJ7z5mZrLC
 rwsWZdvCcpfVXGl/HQpMFMc3V8ZzUNdUAyZn9zXGa7HQG/FgYlsHdScjF2vpVLZ9cp+Uyit4JvU
 cOlunEmb+zrEJyQS6W4XWpYNY8ZX1bCEAyk3w2BC4nIW2hQK0PSohErn1llotzHuBWUMnNr7XbZ
 xVuLwdmG5QBLqIZMvOjlO/duA1HaHTCcFQJyZI5XuW14wv5FYvsFtgfrR5Hqf4WaDk3isAWShSl
 BNpVUSE2dc8E3X9VoEqgzmOLNnUxvnPm3YqeHPU6AlAFxCC3UVjk3zbSs1llA8NBvVZKpbXkzYC
 uMnWC9qR+K3dp+LBcI7YbRa6VV2MaYuwQGd7FjR6ZnC79malliuuUCUWEBqW86xvJGfg8Wh7GQU
 7hloYrs1NgwmhdV95orx+hQbbzp5AHIT/ADtGbhgW6KwymjBmoDffdtUFQ5K9SKbnviT/zXFjMh
 tWQcS8MKZReVbT4JNNw==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6980763d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085

On 26-01-12 14:53:19, Luca Weiss wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
