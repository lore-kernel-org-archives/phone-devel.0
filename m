Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64FA21B9FD
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817742; cv=none; b=Ik9tTcBaZ1zasqZSqQ4egRC41NR6ownAaQCTZ9krzWrdMVsY9u62bIle6nfoKZh3a1phjOEQVQKss6SSeE8uUm9qmF2nx5X7WSDJ29VrW19c7o8PpcVxbSuSOETLMyx5fGA7kJzMBeWzziVz21a8ZTiwOo9eiWflnU9mH8VYEb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817742; c=relaxed/simple;
	bh=M8vmGrv1KiCcDm+3p8w+eSt3k6pyTrlsyhN3Ww/++yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZnZ3N7ZqQuovpz0eOxp8IrFkyqPw6658R3c+tDMpn9nSgQdaz5TlejPun9lTsNVClKzFkAJ41FJezKBqVDiWshX5OQ6HA/zQ//5KtmX2bv/MFjg5zBXcWc7Dtt02j3j6quKwCoV7DVUWeJgfsx1Wx9+4pV4ICjZdPXXiB1AbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ft7GmItb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EazLslB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ft7GmItb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EazLslB4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7YAC597706
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dk6p4tDuo2SuuKCuh4Z0JrgDUUEQWrTdte7wbwvhXDY=; b=ft7GmItbyrSZs8h2
	xc981bLKxdyzan+xhms98N1rHZ3yDIX7polQP8LaAuegUoAEHUZHNuhM+Ny7YQUZ
	nEcrojkM+ka9pOiXyQwiZ/wc7XhgmBYJvaV3ln5lWX5VGp6RWisNoV408hjR00y0
	TpGyp8RbboU38ttdlyj5GM+2OiA2qFIzYF8gwMX539luntGnYdto1/sO3ios0qft
	sVEgTgcf+mxXgGFZf6QH/h4q8k4nA6nN307umhs7+Ue6DgZiHJHxjoZdJKjWCXUy
	uL5WZdin8GJg3Qla+GA2Khz2YgCLAGj/1BQQ0I5aRDxvwcbjbso4eqqqfxmo4CSY
	JF7U6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7g0uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:15:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ba026720eeso1266020785a.1
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768817740; x=1769422540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dk6p4tDuo2SuuKCuh4Z0JrgDUUEQWrTdte7wbwvhXDY=;
        b=EazLslB4lAnSq48yir9e69lHo9R8U7zqcRzlurZsca1D8t/4RKIwgvTs4a0zyO85qN
         AzhhqWXxZGEBOt5XjkzOJIR2Z8uMvZHR+GIay5U5F388C+XHzOsHOkrz0SXacx9VDeSJ
         vzRrnAl3n1VcMIz7YP+e+f8+bspHvTPMwZsudzKA8uNydfC6Cbls7iUbfgRo+Hzyikg3
         SqnwKoN72o/p1elmpeyMfdb1RirUh5spWguE7YRcrgZRaVU1XetEn/yPjMIW/VVaXBAM
         Xdu3OXH6dUsDDu5dxQaMAsss8JXYHZrF61WwCsCJEAkxHufGlj5Eitk1Dn76qDxxiR0d
         UXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817740; x=1769422540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dk6p4tDuo2SuuKCuh4Z0JrgDUUEQWrTdte7wbwvhXDY=;
        b=NtY6VIkwqU2oZ4bhSGCJxu1MSwEArMtXJefvVuz+zhqadlXiKAr8DfJMyQiGotrklQ
         kGrXNaRuuvGG4dVAc34UcJWi9597eY4ET26gicgUZ4HpSVIm9Faq//y1gmUrQkgMQrsG
         0xs3N1LABxZb3Db/z+KVLqCT9h678HmFsLO3TrlnSVCq2FlAQ5xoavEiot7PSTWLy+JZ
         bcamydJA5oIO7J3w7Wu9FLz4cdulZym/CmN4hIf5j3uFb0kPtgPV8VBnHo/pWjbGgURx
         soPn14EI7fFlpV34o+d7VvICf3ibTPPuvXyRVvH542tBXnogThdiUcc0I8oPsdmN1Hz+
         7qhw==
X-Forwarded-Encrypted: i=1; AJvYcCXkfQZIfl5L3gDAuulhQfAEWOwz1NWR5BRL3d00RVfs4bJ1jK4i8kcB4JSe+2BXRBaEFXc3wGqdN8c2Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIM5q0QfKil3ye2IOBasMXP0RGUVZhzl5Ekhm5dP+zSIVkkBkl
	fB4NLy7sgtlbnA3DjX6BNE2uQZwjeOJ1EhB1zCUFbJVNRjEXtSkq59fTRoea8No97//osBB6F47
	ctKqP9aNzelH8udiPj2BclSWZ9bZ1QKqhfGVVlAF3/wQbsQ2aXRCCyJ9kE0rZDXHXjA==
X-Gm-Gg: AY/fxX7+OnmuB90wcpYkKdXkVLqOJApFABVNl5VsXJs/HL0rI1L2p18cJ9fFGIYms59
	9CZqsbM4TVtxXWQgfFEdswnpYVPGKggQYYE3/zib6Jm8xb2qC4L+vlwB/lx3/0cThJX2Be9N86o
	wl8ho3yGqlALL9jlv0QCzUzOMTlWh35dEgZBcr2aH5TOslwYc1JUz75Lx8TYMCW49SnRqXXjY+u
	ebg2dmF58JrjmoNVNGCdXJqN9Eg72cJK3ZvRkwwDUQTTJ9ZKMKN69C5Yg6hDe12xD1KUxO87ua3
	c9eEUVfkpA4gkip35RdhXrkET6Y8AtZTImIPOL1w9uJcyAayRNgh76XWPdD/iTD0asBSpFv1Fc5
	589BaC9GF9bI7B2vsZeplUgZMOf3ab9TBWdaxoQ==
X-Received: by 2002:a05:620a:31a0:b0:827:1bda:ca68 with SMTP id af79cd13be357-8c6a6768546mr1388580385a.46.1768817739590;
        Mon, 19 Jan 2026 02:15:39 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:827:1bda:ca68 with SMTP id af79cd13be357-8c6a6768546mr1388576885a.46.1768817739091;
        Mon, 19 Jan 2026 02:15:39 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921facsm21220514f8f.5.2026.01.19.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:15:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C128F
Date: Mon, 19 Jan 2026 11:15:36 +0100
Message-ID: <176881773405.15929.11747885724390635318.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com> <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfX1uzko+3p11Vv
 uHoD2Zyqql/YUcmQl9Va09uvGPiXTu3oeb9uyhV0c7vXIjZkvhNeV/htH/eVG68WuMJPrHIOVTM
 YivEJpQqbrFlDvKx1sEBIXYn1TvGRtVzgnP8x/IdXfMLvyjYkEj9AO64rczqnAan81rDu2VMuwS
 iW+R+TftuCQKL+dUDDkBG9uHokFf3qehV3zdY9N0x2HENwi7kqS7BNCVsK3ewqREDWQ6IVpDUeG
 hvYQOdgyOsL4MHTocrwSdizabkoJYH3zusifTdPhsBLR9K6MvS8ecsD2ANCxyzlAhjg01U3y8yo
 ec9PdqDWTrxrVmKqeogvfhC84bl8Io3NnBXRZlLoonakiBsYKCOM2tVxNY6MpTy03vgMvJEx6y9
 g3XtB8DFuCz1GuTDv6XlhFGY2DNK/nvxQNRDYH9l6haJAKfW92umr/dMtoBVeBtxgM3KOrlBBs9
 hZ4YYirC2ahLZhiWi1A==
X-Proofpoint-ORIG-GUID: EwnEuxeNJtG0PQKwdXy5jKvXyTFyBBaW
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e044c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d49ADMIpjG4RuIGA6bcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EwnEuxeNJtG0PQKwdXy5jKvXyTFyBBaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190084


On Fri, 16 Jan 2026 14:38:55 +0100, Luca Weiss wrote:
> Add the compatible for an 128Kb EEPROM from Puya.
> 
> 

Applied, thanks!

[1/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C128F
      commit: c6e79d34bf80c008e5f5fba2c8cce3df81a84335

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
