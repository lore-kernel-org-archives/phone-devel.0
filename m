Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF83293B69
	for <phone-devel@vger.kernel.org>; Mon,  7 Jul 2025 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882229; cv=none; b=TzEI4AvGjzTUxDDboycdjN1nM90homVrNvGmnZXE54KFgVpLLGzkbGKWdfYVbAO5/unujJPCRMX6IWbOqChWlDckgoYwSaY6bD6j67mXXIkfE7nHX7GDb/9xTePC+vh3O7IvriyJmZXqCTLfnshRizYwoJ7ViDcXwPUMyTIU1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882229; c=relaxed/simple;
	bh=S6lh/yUM26GwS7sY+Iag1znpRC0NZFsPzPYfvoED7+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbxAjWBVwUkokjw0fSwVqd9Gy1q/rrPeo/t32UspRH6kFY+75CrWdGHL69DIARY9bquwbrfuaAPBJFxq13nu8R4YLJ32Ui8eJoAt/qoVdDvmqb4/3vw/NpmxJreEuF/CiNvcDbM9RPDIPhe54oO6fZgJaNQ5qijadcOH13n/TQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=X4VaSY8R; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="X4VaSY8R"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso5607480a12.2
        for <phone-devel@vger.kernel.org>; Mon, 07 Jul 2025 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882223; x=1752487023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nws26/Ns3LqCHhDj8qpeFEJgKYBLOU5K6Yxp04hjEL4=;
        b=X4VaSY8RyEkC87SHVJ4bFkPacsoL5weK7hpL4ZfhTiArtKqW8hIvAaGmWDIjjQSuUr
         ybO9d0Ax4K0rBnrwga/IfhiGKTax+pcTYDmoO9L0liKsAQZ9lMKCWiNPPdXhU8Odj7U3
         S7GrL0fA0zEWeLBlUx+FbdPDER4lAxdGCY+w/j+3RgYgOwxeLZlIuM7DYPqgggnukqkz
         L8/QwnxOPg4QfUX5KMhZJrOjnBHvP7nzERznJNDmcc5YYdaP/x0z93ZCk+YyP+LxDLtf
         B+wFvnF/ChSAORslwy6A6VY+5eyiIwGOP75YxNu59S7YV/ey8EKa1qzVDLZndGLr0HGa
         Z1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882223; x=1752487023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nws26/Ns3LqCHhDj8qpeFEJgKYBLOU5K6Yxp04hjEL4=;
        b=fNcScSWapJNkDl0p6HpK7HUV5n3gcdiCXanCkP5i2oXxC+97RAC9y5P874O00d0aYx
         pwNtJwwhmvKyI0jKLagaTRWhC1y9Kmne8LWOJcp/46PV4PAjUwL1+VTy58aLoR5barJB
         qvZ0jp3OWiSXVbd6/Ujm4ccm+jkByLxDw4R1hJ1kB57qMbBUZfNAFzf7NQQjkbb5T9Ra
         xQrZdEHOFpvL4v4wNScDML7DJV2n6VdCb5Aatq9QrtkwdcWAUJT8OMArNrjFzOGOnYfj
         5dBCeu7uOASvtev9dOvjH/J5EJDpBH8gQpb4rL1EDXGU6Rg2If0ah+dAHtaP/7xeN+VA
         aVpA==
X-Forwarded-Encrypted: i=1; AJvYcCWDm3OiD0tQ+WMPCm8um6boalj2q2IRXSVZSFU0Clwlpa8HQCQyTfaNsbk/URtBx/GAq0f5/t6LyhLUvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUoM7b6amk6PnABMLFVHI+rsTiMa3nvhltuYz9Rx8kNSZ5iWJr
	Y2a2mGQ5Ct1fIOcn7D3FEGaCKPpGOF41+t+/6PZ4M83uKzJTjts0kROpRFFrn1Cvf4g=
X-Gm-Gg: ASbGncvYj3m7BsaC4mbMG3iQgeFI86vJV/Y9qx2m7EZY2yDUKqD5PMOdx3RR5LqeSWq
	swYRxOdNKYSYVNoxVZdFZw/VLjYdlLNlgKcXzTQlFN8ukjxBm5tUAf5uljQuryiPQ6gh7ike/07
	qn0sHorLwIzQiWbMKg0bWHpM910rDyv/R7v6yG/qhya3RtSDfueTb+EvQaeeRSSjy8qJ96yhBuC
	BV3xvbWJCRGNQSFRmBvuqyXai7Qzt28AEEJjFS0U7QYdWCy57G4MLsKBPL+pM+zUNLpMDxYjlkD
	7on+vwFNEEkfrKwWCRs0N3d0m4TzVQvlM6ogtvXHeC4c4fIYu/vU1aK4cAQoQdwNHj775weow2k
	zGCPJOBDXWfjCf0yRphFFwiQeBqehE7xd
X-Google-Smtp-Source: AGHT+IE/7aWa5Y2fk4CbBdGT0MFe23n2x5akljQOUIlO79bo2MS6xWS+PWbchVlyA4MuTiRxahiEMA==
X-Received: by 2002:a05:6402:518d:b0:607:f63b:aa31 with SMTP id 4fb4d7f45d1cf-60ff38183b4mr7116598a12.6.1751882222926;
        Mon, 07 Jul 2025 02:57:02 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 11:56:37 +0200
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Document the Milos RPMH
 Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-clocks-misc-v2-1-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=812;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S6lh/yUM26GwS7sY+Iag1znpRC0NZFsPzPYfvoED7+M=;
 b=2pPOctPYbsoJV/7q4SeIJ3aZzeCQ4bqEE4XA2bs3+JfYnx/k1QTetvmU6+n6dtdm3kpMRGn1p
 OpBzWTqJahHBhyQN4aB8TAhmO0zN6FHy8QmISjKHL2jFgYIQGeJC3/P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) RPMH Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e01f87d4fc546311eb758ee63af9a..a4414ba0b287b23e69a913d10befa5d7368ff08b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk

-- 
2.50.0

